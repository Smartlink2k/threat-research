# IOCs — Indicators of Compromise

🇫🇷 [Français](#-français) | 🇬🇧 [English](#-english)

---

## 🇬🇧 English

Indicators of compromise collected during independent research, organized
by type. Also submitted to community threat intel platforms (ThreatFox,
URLhaus) where applicable — this folder serves as the canonical, versioned
archive.

### Files

| File | Purpose |
|------|---------|
| [`domains.csv`](domains.csv) | Malicious or compromised domains |
| [`urls.csv`](urls.csv) | Full malicious URLs / paths |
| [`c2-infrastructure.csv`](c2-infrastructure.csv) | Command-and-control domains/endpoints |
| [`archive/`](archive/) | Retired indicators, kept for historical correlation |

### Field definitions

| Field | Description |
|-------|--------------|
| `date_added` | ISO 8601 date (YYYY-MM-DD) this indicator was first documented here |
| `status` | `active`, `resolved`, `compromised-legit-site`, `expired`, `false-positive` |
| `confidence` | `low`, `medium`, `high` — based on corroboration across sources |
| `campaign_ref` | Relative path to the associated writeup, if one exists |
| `notes` | Free text — keep concise |

### Archive

Indicators no longer active or relevant are moved to `archive/` rather than
deleted, preserving historical record for future correlation.

### Usage

Feel free to ingest these files directly (SIEM feed, script, etc.). No
attribution required, but a mention or link back is appreciated.

### Disclaimer

Indicators are provided as-is for defensive purposes. No warranty as to
completeness or continued accuracy — infrastructure changes quickly. Verify
before blocking in production environments.

---

## 🇫🇷 Français

Indicateurs de compromission recueillis dans le cadre de recherches
indépendantes, organisés par type. Également soumis aux plateformes
communautaires de threat intel (ThreatFox, URLhaus) lorsque applicable — ce
dossier sert d'archive canonique et versionnée.

### Fichiers

| Fichier | Contenu |
|---------|---------|
| [`domains.csv`](domains.csv) | Domaines malveillants ou compromis |
| [`urls.csv`](urls.csv) | URLs/chemins malveillants complets |
| [`c2-infrastructure.csv`](c2-infrastructure.csv) | Domaines/points de contrôle C2 |
| [`archive/`](archive/) | Indicateurs retirés, conservés pour corrélation historique |

### Archive

Les indicateurs inactifs sont déplacés vers `archive/` plutôt que supprimés,
pour conserver un historique utile aux corrélations futures.

### Avertissement

Fournis tels quels à des fins défensives. Aucune garantie d'exhaustivité ou
d'exactitude continue. Valider avant tout blocage en production.
