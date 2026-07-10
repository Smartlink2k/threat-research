# Detection Queries

🇫🇷 [Français](#-français) | 🇬🇧 [English](#-english)

---

## 🇬🇧 English

Detection queries developed during research and incident investigation,
shared for reuse by other analysts. Comments are in English regardless of
query language.

### Structure

| Folder | Purpose |
|--------|---------|
| [`kql/`](kql/) | Microsoft Sentinel / Defender Advanced Hunting queries |
| [`sigma/`](sigma/) | Sigma-format rules (SIEM-agnostic), added as queries are ported over time |

Use [`TEMPLATE.kql`](kql/TEMPLATE.kql) as the starting structure for a new query.

### Current queries

| File | Purpose |
|------|---------|
| [`kql/phishing-url-path-detection.kql`](kql/phishing-url-path-detection.kql) | Detects emails containing a specific malicious URL path pattern, regardless of hosting domain |
| [`kql/device-code-phishing-signin.kql`](kql/device-code-phishing-signin.kql) | Detects the OAuth device code error sequence (50125 → 50199 → 0) associated with Storm-2372-style attacks |
| [`kql/email-domain-compromise-correlation.kql`](kql/email-domain-compromise-correlation.kql) | Correlates recipients of a flagged phishing email with subsequent suspicious sign-in attempts within a time window |

### Usage notes

- Column names in Microsoft Defender/Sentinel schemas can drift between
  tenants — always validate with `getschema` before running in production.
- Queries are provided as a starting point, not a drop-in solution. Adjust
  thresholds and time windows to your environment's baseline.

### Disclaimer

Provided as-is for defensive and educational purposes. Test in a
non-production environment before deploying broadly.

---

## 🇫🇷 Français

Requêtes de détection développées lors de recherches et d'investigations
d'incidents, partagées pour réutilisation par d'autres analystes. Les
commentaires sont en anglais peu importe le langage de la requête.

### Structure

| Dossier | Contenu |
|---------|---------|
| [`kql/`](kql/) | Requêtes Microsoft Sentinel / Defender Advanced Hunting |
| [`sigma/`](sigma/) | Règles au format Sigma (agnostique du SIEM), ajoutées au fur et à mesure des portages |

Utilise [`TEMPLATE.kql`](kql/TEMPLATE.kql) comme structure de départ pour
une nouvelle requête.

### Notes d'utilisation

- Les noms de colonnes dans les schémas Microsoft Defender/Sentinel peuvent
  varier d'un tenant à l'autre — toujours valider avec `getschema` avant de
  lancer en production.
- Les requêtes sont un point de départ, pas une solution clé en main. Ajuste
  les seuils et fenêtres temporelles selon la base de référence de ton
  environnement.

### Avertissement

Fournies telles quelles à des fins défensives et éducatives. Tester en
environnement hors production avant tout déploiement large.
