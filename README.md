# Programming for Economists — Group 5

Analysis of the Dutch housing paradox: the coexistence of housing pressure 
and residential vacancy across Dutch municipalities, 2020–2025.

## Authors
Marline Human, Storm Bakker, Nando Fredricks, Jasper Haavekost, Jermaine Koreman  
Tutorial group 1.5 — Lecturer: Chantal Schouwenaar

## Data source
All data come from CBS (Centraal Bureau voor de Statistiek), publication 
*Kerncijfers Wijken en Buurten* (KWB), for the years 2020 through 2025.

The raw data are **not** included in this repository (per course guidance 
data is shared separately). To reproduce the analysis, download the data yourself.

## How to download the data
1. Go to https://www.cbs.nl/nl-nl/reeksen/kerncijfers-wijken-en-buurten
2. For each year 2020–2025, download the Excel file (Kerncijfers wijken en buurten).
3. Place the files in the `data/raw/` folder, using these exact names:
   - `kwb-2020.xlsx`
   - `kwb-2021.xlsx`
   - `kwb-2022.xlsx`
   - `kwb2023.xlsx`
   - `kwb2024.xlsx`
   - `kwb2025.xlsx`

   Note: the 2020–2022 files use a hyphen (`kwb-`), the 2023–2025 files do not (`kwb`).

## How to reproduce
1. Open the R project (`.Rproj`) in RStudio.
2. Restore the package environment: `renv::restore()`
3. Run the cleaning + analysis pipeline: `source("run_all.R")`
4. Knit `Template_Assignment.Rmd` to PDF.

## Repository structure
- `data/raw/` — raw CBS Excel files (not tracked; download yourself, see above)
- `data/clean/` — cleaned dataset produced by the cleaning script
- `scripts/Datacleaning.R` — loads, cleans and combines the raw files
- `run_all.R` — runs the full pipeline
- `Template_Assignment.Rmd` — the report
- `renv.lock` — package versions for reproducibility
