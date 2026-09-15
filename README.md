# National AI Readiness: Determinants and Predictors

## Project Overview
This project investigates which governance, socioeconomic, technological, and
AI-ecosystem characteristics are associated with, and predictive of, national
AI readiness — as measured by the Government AI Readiness Index (Oxford
Insights, "GARI"). Predictors are drawn exclusively from datasets external to
the Index's own construction (World Bank Worldwide Governance Indicators and
World Development Indicators) to avoid circularity between predictors and
outcome.

Four research questions are addressed:
- **RQ1** — Do the highest-readiness, most rank-stable countries (2021-2024)
  differ significantly from the rest on governance, socioeconomic,
  technological, and AI-ecosystem indicators?
- **RQ2** — Which of these indicators predict national AI readiness, and does
  that relationship differ between GARI's pre-2025 and 2025 methodology eras?
- **RQ3** — To what extent can national AI readiness be modelled using
  regression and classification techniques, and does model performance
  differ between the two GARI methodology eras?
- **RQ4** — Which indicators are most important to predicted readiness, and
  are there identifiable threshold values associated with top-tier status?

GARI underwent a substantial methodological revision in 2025 (3 to 6 pillars,
roughly 40 to 69 underlying indicators), which limits direct year-over-year
comparability of raw scores. This study treats the pre-2025 and 2025 editions
as distinct methodological eras throughout, rather than pooling them.

This repository accompanies a QM 640 Capstone project (Walsh College).

## Data Sources

| Source | Role | Location | Original URL |
|---|---|---|---|
| Government AI Readiness Index (Oxford Insights) | Outcome variable, 5 yearly editions (2021-2025) | `data/raw/oxford/` | https://oxfordinsights.com/ai-readiness/ |
| World Development Indicators (World Bank) | Predictors (connectivity, socioeconomic, AI-ecosystem) | `data/raw/wdi/` | https://databank.worldbank.org/source/world-development-indicators |
| Worldwide Governance Indicators (World Bank) | Predictors (governance) | `data/raw/wgi/` | https://databank.worldbank.org (bundled within WDI) |
| Stanford AI Index (Global AI Vibrancy Tool) | Contextual/narrative reference only — not used as a model input due to limited (~36) country coverage | `stanford/` | https://aiindex.stanford.edu/vibrancy |

See the full Data Dictionary in the final report for variable-level
definitions, units, and exclusions (e.g., WGI Government Effectiveness and
WDI Secure Internet Servers per capita are excluded from the predictor set,
as both are direct inputs into GARI's own methodology).

## Final Predictor Set

Eight predictors, all sourced externally to GARI:

- **Governance (2):** Control of Corruption, Political Stability & Absence of
  Violence (WGI). *Rule of Law was dropped after a multicollinearity check
  found it highly correlated with Control of Corruption (r = 0.95, VIF > 10)
  — see the final report's Feature Engineering and Limitations sections.*
- **Connectivity (2):** [fill in — e.g., Individuals using the Internet (%),
  Fixed broadband subscriptions]
- **Socioeconomic (1):** GDP per capita
- **Higher education (1):** Tertiary enrolment (%)
- **AI-ecosystem proxy (2):** [fill in — e.g., Scientific & Technical Journal
  Articles, Researchers in R&D per million people]

Missing values are handled via peer-group (region × income classification)
mean imputation, consistent with GARI's own disclosed methodology.

## Repository Structure
```
data/raw/          Original, unmodified source files (Oxford, WDI, WGI)
data/processed/    Cleaned, merged analytic dataset (country x year x variables)
scripts/           Data retrieval, cleaning, merging, and imputation code
notebooks/         [fill in — Colab notebook filename, e.g. QM640_Capstone_Analysis.ipynb]
outputs/           [fill in — figures, tables, and model artefacts generated from the notebook]
stanford/          Reference material only (not used in modeling)
```

## Analytic Pipeline

Data Ingestion → Preprocessing → EDA → Feature Engineering → Model Development
→ Model Evaluation → Deployment (see the final report's Architecture
Diagram/Workflow section for the full diagram and per-stage detail). In brief:

1. **Ingestion:** raw retrieval of WDI, WGI, and all five GARI editions.
2. **Preprocessing:** ISO3 country-code harmonisation, removal of World Bank
   aggregate/region codes, a rolling multi-year lag merge, and peer-group
   mean imputation.
3. **EDA:** missingness, outlier, and distribution checks; correlation/VIF
   screening (which surfaced the Rule of Law redundancy above).
4. **Feature Engineering:** final 8-predictor set, log-transform of the
   right-skewed AI-ecosystem journal-articles predictor, standardisation.
5. **Model Development:** Linear/Logistic Regression baselines vs. Random
   Forest, fit separately per GARI methodology era.
6. **Model Evaluation:** grouped (country-level) 5-fold cross-validation,
   permutation tests, F-tests, SHAP and odds-ratio importance methods.
7. **Deployment:** a lightweight, indicator-based policy tool concept —
   predicted readiness tier and gap-to-threshold per country — described in
   the final report's Implementation and User Benefit section.

## Key Results (Summary)

- **RQ1:** 8 of 9 originally-tested predictors differ significantly between
  the highest-readiness/most-stable countries and the rest (Bonferroni-
  corrected).
- **RQ2:** Governance quality (Control of Corruption) is the most consistent,
  policy-actionable predictor across both methodology eras; GDP per capita
  and AI-ecosystem output also show large effects but are less directly
  policy-controllable.
- **RQ3:** Random Forest predicts national AI readiness significantly better
  than chance in both eras (R² ≈ 0.87; classification ROC-AUC ≥ 0.95) and,
  unlike the Linear/Logistic baselines, its performance is statistically
  stable across GARI's 2025 methodology revision.
- **RQ4:** Identifiable threshold values exist for several predictors (e.g.,
  GDP per capita ≈ $29,000-30,000) associated with top-tier readiness status;
  these thresholds are stable across methodology eras.

Full results, statistical tests, and discussion are in the final report
(not included in this repository).

## Reproducibility Notes
- Raw WDI/WGI/GARI files are retained as originally downloaded.
- The processed analytic dataset (`data/processed/analytic_dataset.csv`)
  contains 194 of 195 countries (Taiwan structurally excluded — no World Bank
  data) across the 8 finalised predictors.
- Retrieval date: [fill in]
- Missing value treatment: peer-group (region × income) mean imputation;
  zero missing values remain across all 8 predictors in the final dataset.
- To reproduce: open `notebooks/[fill in notebook filename]` in Google Colab
  and run top to bottom; each stage's script is also available standalone
  under `scripts/` in the order described in the Analytic Pipeline above.

## Status
✅ Final report complete. Data pipeline, EDA, RQ1-4 modelling and hypothesis
testing, and the final report are all finished. This repository contains the
supporting data, scripts, and notebook.
