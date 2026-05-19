Project Title: Enterprise HR Data Ingestion Pipeline & Quality Schema Audit

Objective: Developed a comprehensive SQL-based data-profiling and standardization framework to audit, clean, and validate an incoming human resources dataset prior to production database loading.

Key Technical Achievements:

•	Pipeline Traceability & Ingestion: Established a strict data-governance workflow by isolating raw payloads into isolated staging environments (LIKE schemas) to preserve data lineage and protect production environments.

•	Encoding Artifact Remediation: Identified and resolved critical structural file-drift anomalies caused by character encoding errors (ï»¿EmpID byte-order marks).

•	Data Profiling & Drift Correction: Designed targeted SQL auditing scripts to scan for duplicate records, standardize inconsistent text strings (e.g., business travel metrics), and correct anomalies across high-volume fields.

•	Business-Rule Constraint Validation: Enforced data integrity controls by validating survey metrics (Job Satisfaction and Work-Life Balance scores) against designated business limits and mapping wage distributions to flag out-of-bounds outliers.

•	Schema Metadata Auditing: Queried system metadata (INFORMATION_SCHEMA) to perform source-to-target data verification, ensuring downstream reporting accuracy and data-type alignment.



