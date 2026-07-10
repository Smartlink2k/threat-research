# Threat Research

🇫🇷 [Français](#-français) | 🇬🇧 [English](#-english)

---

## 🇬🇧 English

### About

My name is Jean-Philippe Thibault, a cybersecurity analyst based in Quebec,
Canada. This repository collects my independent research: analysis of
active phishing campaigns, observed malicious infrastructure, and technical
detection notes.

I am not affiliated with any organization in the context of this work — the
observations shared here come from personal research and cybersecurity
monitoring.

### Repository structure

| Folder | Description |
|--------|--------------|
| [`writeups/`](writeups/) | Technical writeups on phishing campaigns and malicious infrastructure |
| [`iocs/`](iocs/) | Machine-readable indicators of compromise (CSV) |
| [`detection-queries/`](detection-queries/) | Reusable KQL/Sigma detection queries |
| [`notes/`](notes/) | Methodology and glossary |

### Latest writeups

| Date | Title |
|------|-------|
| 2026-07 | [Storm-2372-style device code phishing via compromised legitimate site](writeups/2026-07-storm2372-fxsroofing/README.md) |

Full index: [`writeups/README.md`](writeups/README.md)

### Current focus

- Device code phishing campaigns (Storm-2372 pattern and variants)
- Legitimate websites compromised and used as phishing vectors
- Detection methodology via Advanced Hunting (KQL)

### Quick links

- [Writeup template](writeups/TEMPLATE.md) — for anyone wanting to see the structure used
- [IOC format documentation](iocs/README.md)
- [Detection queries index](detection-queries/README.md)
- [Methodology](notes/methodology.md)
- [Glossary](notes/glossary.md)

### Contributing / Reporting

If you have additional information about any campaign documented here, or
want to report an error, please [open an issue](https://github.com/Smartlink2k/threat-research/issues)
or reach out directly.

### Disclaimer

Content in this repo is published only after affected organizations have had
the opportunity to remediate identified issues (responsible disclosure). No
information that could further compromise a victim is shared here. See
[`notes/methodology.md`](notes/methodology.md) for the full approach.

### Contact

- GitHub: [@Smartlink2k](https://github.com/Smartlink2k)
- Email: [to define]

### License

See [LICENSE](LICENSE) — MIT.

---

## 🇫🇷 Français

### À propos

Je m'appelle Jean-Philippe Thibault, analyste en cybersécurité basé au
Québec, Canada. Ce repository regroupe mes travaux de recherche
indépendants : analyse de campagnes de phishing actives, infrastructures
malveillantes observées, et notes techniques de détection.

Je ne suis affilié à aucune organisation dans le cadre de ce travail — les
observations partagées ici proviennent de recherche personnelle et de veille
en cybersécurité.

### Structure du repo

| Dossier | Description |
|---------|--------------|
| [`writeups/`](writeups/) | Analyses techniques de campagnes et d'infrastructures malveillantes |
| [`iocs/`](iocs/) | Indicateurs de compromission structurés (CSV) |
| [`detection-queries/`](detection-queries/) | Requêtes de détection KQL/Sigma réutilisables |
| [`notes/`](notes/) | Méthodologie et glossaire |

### Derniers writeups

| Date | Titre |
|------|-------|
| 2026-07 | [Hameçonnage par device code (pattern Storm-2372) via un site légitime compromis](writeups/2026-07-storm2372-fxsroofing/README.md) |

Index complet : [`writeups/README.md`](writeups/README.md)

### Focus actuel

- Campagnes d'hameçonnage par device code (pattern Storm-2372 et variantes)
- Sites légitimes compromis utilisés comme vecteurs de phishing
- Méthodologie de détection via Advanced Hunting (KQL)

### Liens rapides

- [Gabarit de writeup](writeups/TEMPLATE.md)
- [Documentation du format IOC](iocs/README.md)
- [Index des requêtes de détection](detection-queries/README.md)
- [Méthodologie](notes/methodology.md)
- [Glossaire](notes/glossary.md)

### Contribuer / Signaler

Si vous avez des informations complémentaires sur l'une des campagnes
documentées ici, ou si vous souhaitez signaler une erreur, [ouvrez une issue](https://github.com/Smartlink2k/threat-research/issues)
ou contactez-moi directement.

### Avertissement

Le contenu de ce repo est publié uniquement après que les organisations
concernées aient eu la possibilité de remédier aux problèmes identifiés
(divulgation responsable). Voir [`notes/methodology.md`](notes/methodology.md)
pour l'approche complète.

### Contact

- GitHub : [@Smartlink2k](https://github.com/Smartlink2k)
- Courriel : [à définir]

### Licence

Voir [LICENSE](LICENSE) — MIT.
