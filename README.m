# National AI Readiness: Determinants and Predictors

## Project Overview
This project investigates which governance, socioeconomic, technological, and 
AI-ecosystem characteristics are associated with, and predictive of, national 
AI readiness — as measured by the Government AI Readiness Index (Oxford Insights). 
Predictors are drawn exclusively from datasets external to the Index's own 
construction (World Bank Worldwide Governance Indicators and World Development 
Indicators) to avoid circularity between predictors and outcome.

This repository accompanies a QM 640 Capstone project (Walsh College).

## Data Sources

| Source | Role | Location | Original URL |
|---|---|---|---|
| Government AI Readiness Index (Oxford Insights) | Outcome variable | 'data/raw/oxford/' | https://oxfordinsights.com/ai-readiness/ |
| World Development Indicators (World Bank) | Predictors (connectivity, socioeconomic, tech) | 'data/raw/wdi/' | https://databank.worldbank.org/source/world-development-indicators |
| Worldwide Governance Indicators (World Bank) | Predictors (governance) | 'data/raw/wgi/' | https://databank.worldbank.org (bundled within WDI) |
| Stanford AI Index (Global AI Vibrancy Tool) | Contextual/narrative reference only — not used as a model input due to limited (~36) country coverage | 'stanford/' | https://aiindex.stanford.edu/vibrancy |

See the full Data Dictionary in the project synopsis for variable-level definitions, 
units, and exclusions (e.g., WGI Government Effectiveness and WDI Secure Internet 
Servers per capita are excluded from the predictor set as they are directly 
incorporated into GARI's own methodology).

## Repository Structure
data/raw/          Original, unmodified source files
data/processed/    Cleaned, merged analytic dataset (country x year x variables)
scripts/           Data retrieval and cleaning code
stanford/          Reference material only (not used in modeling)

## Reproducibility Notes
- Raw WDI/WGI files are retained as originally downloaded from World Bank DataBank.
- The processed analytic dataset (`data/processed/analytic_dataset.csv`) contains 
  only the ~195 countries and variables described in the Data Dictionary.
- Retrieval date: [fill in]
- Missing value treatment: [to be finalized after completeness audit — see synopsis]

## Status
🚧 In progress — synopsis stage. Analysis scripts and processed dataset to follow.
