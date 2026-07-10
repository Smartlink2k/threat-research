# Writeups

🇫🇷 [Français](#-français) | 🇬🇧 [English](#-english)

---

## 🇬🇧 English

Technical writeups on phishing campaigns, compromised infrastructure, and
threat actor patterns observed during independent research. Written in
English by default for broader reach — see the [main repo README](../README.md)
for language policy.

### Index

| Date | Title | Summary |
|------|-------|---------|
| 2026-07 | [Storm-2372-style device code phishing via compromised legitimate site](2026-07-storm2372-fxsroofing/README.md) | Phishing kit abusing Microsoft device code OAuth flow, hosted on a compromised legitimate business website |

*(New entries added here as they're published, most recent first.)*

### Structure

Each writeup lives in its own dated folder:

YYYY-MM-topic-shortname/
├── README.md       # the full writeup
├── screenshots/    # visual evidence
└── artifacts/      # sanitized HTML/JS/other extracted evidence

Use [`TEMPLATE.md`](TEMPLATE.md) as the starting point for new entries.

### Before publishing a new writeup

- [ ] Affected organizations notified where applicable (responsible disclosure)
- [ ] No live credentials, tokens, or PII in code snippets or artifacts
- [ ] IOCs cross-posted to [`/iocs/`](../iocs/) with correct `campaign_ref`
- [ ] Disclaimer section included

---

## 🇫🇷 Français

Analyses techniques de campagnes de phishing, d'infrastructures compromises,
et de patterns d'acteurs de menace observés dans le cadre de recherches
indépendantes. Rédigées en anglais par défaut pour une plus grande portée —
voir le [README principal du repo](../README.md) pour la politique de langue.

### Structure

Chaque writeup a son propre dossier daté (voir structure en anglais
ci-dessus — identique peu importe la langue).

Utilise [`TEMPLATE.md`](TEMPLATE.md) comme point de départ pour un nouveau cas.

### Avant de publier un nouveau writeup

- [ ] Organisations affectées notifiées lorsque applicable (divulgation responsable)
- [ ] Aucun identifiant, jeton ou renseignement personnel dans le code ou les artefacts
- [ ] IOCs ajoutés dans [`/iocs/`](../iocs/) avec le bon `campaign_ref`
- [ ] Section avertissement incluse
