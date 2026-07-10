# Storm-2372-Style Device Code Phishing via Compromised Legitimate Website

**Date published**: 2026-07-10
**Date observed**: 2026-07-08
**Author**: Jean-Philippe Thibault
**Severity/Impact**: High
**Status**: Active (as of publish date)

---

## TL;DR

A phishing kit impersonating Microsoft SharePoint, branded "PreconSuite,"
was found hosted on a compromised legitimate business website
(fxsroofing.com). The kit implements a real-time device code phishing flow
that abuses Microsoft's legitimate OAuth device authorization grant,
consistent with patterns Microsoft has attributed to the threat cluster
Storm-2372. The kit's backend infrastructure resolves to `redsteel.cc`.

## Summary

While investigating a recurring phishing campaign using the URL path
`/trans-canada/project/`, the hosting domain was identified as
`fxsroofing.com` — a legitimate, long-standing business website (FXS
Roofing & Sheet Metal, LLC) that had been compromised to host malicious
content under a subdirectory, while the rest of the site continued to
function normally for legitimate visitors.

The phishing page mimics a SharePoint "shared file" notification and walks
the victim through a real device code authentication flow against
Microsoft's actual infrastructure, capturing the resulting OAuth session
for the attacker rather than the victim.

## Background / Context

- Discovered via email flow analysis (Microsoft 365 Defender Advanced
  Hunting), tracking a recurring URL path pattern across rotating
  compromised domains.
- The attack chain and error behavior observed are consistent with
  publicly documented device code phishing techniques attributed by
  Microsoft to the Storm-2372 threat cluster. This writeup does not claim
  independent attribution — the pattern match is behavioral, not confirmed
  actor identification.
- Notable because the hosting vector is a compromised legitimate site
  rather than attacker-registered infrastructure, which allows the
  campaign to inherit domain reputation and evade some reputation-based
  filtering.

## Technical Analysis

### Attack chain / Flow

1. Victim receives a phishing email containing a link to
   `fxsroofing.com/trans-canada/project/`.
2. The page loads a SharePoint-branded interface ("PreconSuite") claiming
   a file requires identity verification.
3. On page load, a JavaScript function (`sf()`) calls `POST /api/session/init`
   on the kit's backend, passing a per-session `X-Antibot-Token` header.
4. The backend response contains a `userCode` and `sessionId` — this
   `userCode` is a real Microsoft device authorization code obtained by the
   attacker's own backend session against Microsoft's device code endpoint.
5. The victim is instructed to copy this code and click "Continue to
   Microsoft," which opens a popup to the legitimate
   `microsoft.com/devicelogin` page.
6. The victim authenticates and enters the code on the real Microsoft page,
   unknowingly approving the attacker's session.
7. The kit polls `GET /api/session/status/{sessionId}` (function `ck()`)
   every second. Once Microsoft confirms authentication, the attacker's
   backend retrieves the resulting OAuth token.
8. The victim is redirected to a legitimate Box.com link, providing a
   plausible-looking conclusion to the interaction.

### Code / artifacts

Session initialization (function names and structure preserved, sanitized
of session-specific values):

```javascript
async function sf() {
    const r = await fetch('/api/session/init', {
        method: 'POST',
        headers: { 'X-Antibot-Token': at }
    });
    const d = await r.json();
    document.getElementById('uc').textContent = d.userCode;
    sid = d.sessionId;
    pi = setInterval(ck, 1000);
}
```

Status polling and redirect on completion:

```javascript
async function ck() {
    const r = await fetch('/api/session/status/' + sid);
    const d = await r.json();
    if (d.status === 'completed') {
        clearInterval(pi);
        window.location.replace('https://app.box.com/s/re67no54saido6fxo46uijs41lzbchip');
    }
}
```

An observed error state exposed backend infrastructure directly:

API connection failed (HTTP 0): Could not resolve host: 4483b4.redsteel.cc

**Note on the antibot token**: the `X-Antibot-Token` value was observed to
differ between two separate page loads of the identical kit (same HTML/CSS/
JS otherwise), confirming it is generated per-session server-side rather
than hardcoded. The header *name* is a stable signature; the header *value*
is not a usable static indicator.

### Infrastructure

| Type | Value | Notes |
|------|-------|-------|
| Compromised host | fxsroofing.com | Legitimate business site, compromise limited to a subdirectory |
| C2 / backend domain | redsteel.cc | Serves the session init/status API |
| Observed API host | 4483b4.redsteel.cc | Subdomain seen in error message; DNS resolution intermittent |
| Redirect destination | app.box.com/s/re67no54saido6fxo46uijs41lzbchip | Legitimate Box.com service, likely an abused/temporary share link |

## Indicators of Compromise (IOCs)

| Type | Value | Confidence |
|------|-------|------------|
| Compromised domain | fxsroofing.com | High |
| URL path | /trans-canada/project/ | High |
| C2 domain | redsteel.cc | High |
| Subdomain | 4483b4.redsteel.cc | Medium |

→ Full IOC list: [`/iocs/domains.csv`](../../iocs/domains.csv),
[`/iocs/urls.csv`](../../iocs/urls.csv),
[`/iocs/c2-infrastructure.csv`](../../iocs/c2-infrastructure.csv)

## Detection

Structural fingerprint (function names, API paths, branding, CSS class
pattern) rather than the antibot token value, since the token rotates per
session.

```kql
// See /detection-queries/kql/phishing-url-path-detection.kql
// See /detection-queries/kql/device-code-phishing-signin.kql
```

A YARA rule targeting the kit's fixed structural elements is available at
[`/detection-queries/yara/preconsuite-devicecode-kit.yar`](../../detection-queries/yara/preconsuite-devicecode-kit.yar).

## Mitigation / Recommendations

- Block the specific compromised path via Tenant Allow/Block List:
  `fxsroofing.com/trans-canada/project/*`
- Deploy a mail flow (transport) rule matching the URL path pattern via
  regex, since the campaign rotates across multiple compromised legitimate
  domains and per-domain blocking alone does not scale.
- Monitor for the OAuth device code error sequence (50125 → 50199 → 0) in
  sign-in logs as a behavioral indicator of successful device code phishing.
- Where technically feasible, disable or restrict the device code
  authentication flow for users who do not require it (e.g., via Conditional
  Access policies restricting the authentication flow).

## Timeline of Disclosure

| Date | Event |
|------|-------|
| 2026-07-08 | Campaign first observed via email flow analysis |
| 2026-07-08 | Compromised site (fxsroofing.com) identified |
| 2026-07-09 | Backend C2 infrastructure (redsteel.cc) identified via error message |
| — | FXS Roofing & Sheet Metal, LLC notified of compromise (pending) |
| — | Reports filed with CAFC, APWG, Canadian Centre for Cyber Security |
| 2026-07-10 | Public writeup published |

## References

- Microsoft's public documentation on device code phishing techniques and
  the Storm-2372 designation
  https://www.microsoft.com/en-us/security/blog/2025/02/13/storm-2372-conducts-device-code-phishing-campaign/****
- jeffreyappel
  https://jeffreyappel.nl/how-to-protect-against-device-code-flow-abuse-storm-2372-attacks-and-block-the-authentication-flow/
- thehackernews
  https://thehackernews.com/2026/07/debull-tooling-abuses-microsoft-device.html
  

## Disclaimer

Findings are shared for defensive and educational purposes. FXS Roofing &
Sheet Metal, LLC was notified as the affected legitimate site owner prior
to publication. This analysis reflects observations at the time of writing
and may not represent the current state of the infrastructure described.
No credentials, tokens, or victim data are included in this writeup.
