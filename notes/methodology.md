# Methodology

How research in this repo is conducted — kept here once instead of repeated
in every writeup.

## Reconnaissance approach

- Passive recon first, always — no active scanning/interaction with
  suspected malicious infrastructure until intent is confirmed and legal/
  ethical boundaries are clear.
- Sources used: [certificate transparency logs (crt.sh), vendor forums,
  abuse.ch feeds, OSINT search patterns, etc. — list what you actually use]

## Tools

| Tool | Purpose |
|------|---------|
| Microsoft Defender Advanced Hunting (KQL) | Email/identity telemetry analysis |
| crt.sh | Certificate transparency lookups |
| [tool] | [purpose] |

## Verification standards

- An indicator is marked `high confidence` only when corroborated by
  [define your bar — e.g., "at least two independent sources" or "direct
  observation plus one external feed"]
- [Add your own rules here as they solidify]

## Disclosure approach

- Affected organizations are notified before publication when identifiable
  and reachable.
- A minimum of [X days/weeks] is given for response before publishing,
  unless the threat is actively harming users and withholding would cause
  more damage than disclosure.
- Victim organizations are not named if remediation is still in progress,
  unless already publicly reported elsewhere.

## Scope / What this repo does NOT do

- No active exploitation or unauthorized access testing against third-party
  infrastructure — analysis is limited to what's observable passively or
  within environments I'm authorized to test.
- No malware samples are hosted here — IOCs and behavior only.
