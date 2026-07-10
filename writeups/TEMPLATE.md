# [Campaign/Vulnerability Name] — [Short Descriptive Title]

**Date published**: YYYY-MM-DD

**Date observed**: YYYY-MM-DD (first observation, if different from publish date)

**Author**: Jean-Philippe Thibault

**Severity/Impact**: Low / Medium / High / Critical

**Status**: Active / Remediated / Under investigation

---

## TL;DR

What is this, who does it affect, why should the reader care.
(2-3 sentences)

## Summary

A short narrative overview of what was found, without technical depth yet.
This is the "elevator pitch" version — expand into full detail below.

## Background / Context

- How this was discovered (e.g., email flow analysis, OSINT, passive recon)
- Why it's notable (novel technique, high volume, targets a specific sector, etc.)
- Related known campaigns/threat actors if applicable — cite the source
  that established any attribution claim

## Technical Analysis

### Attack chain / Flow

Step-by-step walkthrough of the mechanism. Use a numbered list or a diagram
if the flow has more than ~4 steps.

1.
2.
3.

### Code / artifacts

Explaination of what each snippet does, with annotations.

### Infrastructure

| Type | Value | Notes |
|------|-------|-------|
| Domain | | |
| C2 | | |
| Hosting/ASN | | |

## Indicators of Compromise (IOCs)

Summary table here; full machine-readable IOCs go in [`/iocs/`](../../iocs/),
linked below.

| Type | Value | Confidence |
|------|-------|------------|
| | | |

→ Full IOC list: [`/iocs/domains.csv`](../../iocs/domains.csv) (or relevant file)

## Detection

Link to detection queries in [`/detection-queries/`](../../detection-queries/),
and/or inline a key query here if it's central to the writeup.

```kql
// See /detection-queries/kql/[filename].kql for the full query
```

## Mitigation / Recommendations

Practical steps a reader can take: blocking, hardening, user awareness, etc.
Be specific — "block X pattern via Y mechanism," not generic advice.

## Timeline of Disclosure

*(Include only if a vendor/organization was contacted — omit this section
entirely if not applicable.)*

| Date | Event |
|------|-------|
| | Initial discovery |
| | Vendor/organization notified |
| | Response received / no response |
| | Public disclosure |

## References

- [Link 1]
- [Link 2]

## Disclaimer

Findings are shared for defensive and educational purposes. Any affected
organization named here was notified prior to publication where applicable.
This analysis reflects observations at the time of writing and may not
represent the current state of the infrastructure described.
