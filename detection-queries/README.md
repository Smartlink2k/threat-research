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
| [`yara/`](yara/) | YARA rules for identifying phishing kit source/structure across domains |

Use [`kql/TEMPLATE.kql`](kql/TEMPLATE.kql) as the starting structure for a new query.

### Current queries

| File | Purpose |
|------|---------|
| [`kql/phishing-url-path-detection.kql`](kql/phishing-url-path-detection.kql) | Detects emails containing a specific malicious URL path pattern, regardless of hosting domain |
| [`kql/device-code-phishing-signin.kql`](kql/device-code-phishing-signin.kql) | Correlates clicks on device-code-login-style URLs with subsequent risky sign-ins matching the device code error signature (50125 → 50199 → 0) |
| [`kql/email-domain-compromise-correlation.kql`](kql/email-domain-compromise-correlation.kql) | Correlates recipients of a flagged phishing email with subsequent suspicious sign-in attempts within a time window |
| [`yara/preconsuite-devicecode-kit.yar`](yara/preconsuite-devicecode-kit.yar) | Structural fingerprint for the "PreconSuite"-branded device code phishing kit (Storm-2372-style) |

### Usage notes

- Column names in Microsoft Defender/Sentinel schemas can drift between
  tenants — always validate with `getschema` before running in production.
- Beta tables (e.g. `AADSignInEventsBeta`) are especially prone to schema
  changes without notice — re-validate column types (not just names) on
  each new deployment, particularly enum-like fields such as risk levels,
  which may be represented as numeric codes or strings depending on tenant
  and schema version.
- Queries are provided as a starting point, not a drop-in solution. Adjust
  thresholds and time windows to your environment's baseline.
- When correlating across tables using identifiers like `CorrelationId` or
  `SessionId`, confirm these persist consistently across the relevant event
  sequence in your tenant before trusting grouped/aggregated results.

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
| [`yara/`](yara/) | Règles YARA pour identifier la source/structure d'un kit de phishing peu importe le domaine |

Utilise [`kql/TEMPLATE.kql`](kql/TEMPLATE.kql) comme structure de départ pour
une nouvelle requête.

### Requêtes actuelles

| Fichier | Objectif |
|---------|----------|
| [`kql/phishing-url-path-detection.kql`](kql/phishing-url-path-detection.kql) | Détecte les courriels contenant un chemin d'URL malveillant spécifique, peu importe le domaine hôte |
| [`kql/device-code-phishing-signin.kql`](kql/device-code-phishing-signin.kql) | Corrèle les clics sur des URLs de type device-code-login avec des sign-ins à risque subséquents correspondant à la signature d'erreur (50125 → 50199 → 0) |
| [`kql/email-domain-compromise-correlation.kql`](kql/email-domain-compromise-correlation.kql) | Corrèle les destinataires d'un courriel de phishing signalé avec des tentatives de sign-in suspectes subséquentes dans une fenêtre temporelle |
| [`yara/preconsuite-devicecode-kit.yar`](yara/preconsuite-devicecode-kit.yar) | Empreinte structurelle du kit de phishing "PreconSuite" (pattern Storm-2372) |

### Notes d'utilisation

- Les noms de colonnes dans les schémas Microsoft Defender/Sentinel peuvent
  varier d'un tenant à l'autre — toujours valider avec `getschema` avant de
  lancer en production.
- Les tables beta (ex: `AADSignInEventsBeta`) sont particulièrement sujettes
  à des changements de schéma sans préavis — revalider le **type** des
  colonnes (pas juste leur nom) à chaque nouveau déploiement, surtout les
  champs de type énumération (comme les niveaux de risque), qui peuvent être
  numériques ou textuels selon le tenant et la version du schéma.
- Les requêtes sont un point de départ, pas une solution clé en main. Ajuste
  les seuils et fenêtres temporelles selon la base de référence de ton
  environnement.
- Lors de corrélations entre tables via des identifiants comme
  `CorrelationId` ou `SessionId`, confirme qu'ils persistent de façon
  cohérente à travers la séquence d'événements pertinente dans ton tenant
  avant de te fier aux résultats groupés/agrégés.

### Avertissement

Fournies telles quelles à des fins défensives et éducatives. Tester en
environnement hors production avant tout déploiement large.
