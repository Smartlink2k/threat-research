# Glossary

Terms and patterns referenced repeatedly across writeups and detection
queries. Add entries as they come up rather than redefining them each time.

## Terms

**C2 (Command and Control)**
Infrastructure used by an attacker to communicate with compromised systems
or exfiltrate stolen data/credentials after initial compromise.

**Device code phishing**
A phishing technique that abuses OAuth's device authorization grant flow.
The victim is tricked into entering a real, attacker-obtained device code
on the legitimate Microsoft login page, unknowingly authorizing the
attacker's session.

**Compromised legitimate site**
A domain with a genuine, unrelated business behind it that has been
breached and repurposed (often via a subdirectory) to host phishing or
malware content, while the rest of the site continues functioning normally.

**IOC (Indicator of Compromise)**
A piece of forensic data — domain, URL, hash, IP, etc. — associated with
malicious activity, used to detect or block related threats.

**TABL (Tenant Allow/Block List)**
Microsoft 365 Defender feature for blocking or allowing specific senders,
domains, URLs, or files at the tenant level.

**Storm-2372**
Microsoft's designation for a threat actor cluster observed using device
code phishing techniques. [Add link to Microsoft's naming reference once
you have one you're confident citing.]

## Pattern shorthand used in this repo

*(Add abbreviations or shorthand you find yourself reusing — e.g., naming
conventions for campaign references, confidence-level shorthand, etc.)*

---

*This glossary is a living document — update it whenever a writeup
introduces a term that isn't self-explanatory to a reader outside your
immediate context.*
