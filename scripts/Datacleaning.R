# Installing packages which will be used. ----
# Run this once in the console, not in the Rmd chunk:
# install.packages(c("here","readxl","readr","dplyr","janitor","tidyr","ggplot2","stringr"))

# Add packages. ----

library(here)
library(readxl)
library(readr)
library(dplyr)
library(janitor)
library(tidyr)


# Import the Excel files for the years: 2020-2025 ----

# 2020 ----
kwb2020raw <- read_excel(here("data", "raw", "kwb-2020.xlsx"),
                         sheet = 1, na = c(".", "", "NA"))
kwb2020raw <- clean_names(kwb2020raw)
write_csv(kwb2020raw, here("data", "raw", "kwb2020_raw.csv"))

# 2021 ----
kwb2021raw <- read_excel(here("data", "raw", "kwb-2021.xlsx"),
                         sheet = 1, na = c(".", "", "NA"))
kwb2021raw <- clean_names(kwb2021raw)
write_csv(kwb2021raw, here("data", "raw", "kwb2021_raw.csv"))

# 2022 ----
kwb2022raw <- read_excel(here("data", "raw", "kwb-2022.xlsx"),
                         sheet = 1, na = c(".", "", "NA"))
kwb2022raw <- clean_names(kwb2022raw)
write_csv(kwb2022raw, here("data", "raw", "kwb2022_raw.csv"))

# 2023 ----
kwb2023raw <- read_excel(here("data", "raw", "kwb2023.xlsx"),
                         sheet = 1, na = c(".", "", "NA"))
kwb2023raw <- clean_names(kwb2023raw)
write_csv(kwb2023raw, here("data", "raw", "kwb2023_raw.csv"))

# 2024 ----
kwb2024raw <- read_excel(here("data", "raw", "kwb2024.xlsx"),
                         sheet = 1, na = c(".", "", "NA"))
kwb2024raw <- clean_names(kwb2024raw)
write_csv(kwb2024raw, here("data", "raw", "kwb2024_raw.csv"))

# 2025 ----
kwb2025raw <- read_excel(here("data", "raw", "kwb2025.xlsx"),
                         sheet = 1, na = c(".", "", "NA"))
kwb2025raw <- clean_names(kwb2025raw)
write_csv(kwb2025raw, here("data", "raw", "kwb2025_raw.csv"))


# Selected variables ----

selected_vars <- c(
  "year", "gwb_code", "gm_naam", "recs",
  "a_woning", "a_hh", "p_leegsw", "g_wozbag",
  "p_koopw", "p_huurw", "p_wcorpw", "p_ov_hw",
  "ste_mvs", "bev_dich", "a_inw"
)


# Cleaning per year ----

clean_year <- function(raw_csv, year_val) {
  df <- read_csv(raw_csv, na = c(".", "", "NA"), show_col_types = FALSE)
  df <- df[df$recs == "Gemeente", ]
  df$year <- year_val
  available <- selected_vars[selected_vars %in% names(df)]
  df <- df[, available]
  df$g_wozbag <- df$g_wozbag * 1000
  df
}

kwb2020_selected <- clean_year(here("data", "raw", "kwb2020_raw.csv"), 2020)
kwb2021_selected <- clean_year(here("data", "raw", "kwb2021_raw.csv"), 2021)
kwb2022_selected <- clean_year(here("data", "raw", "kwb2022_raw.csv"), 2022)
kwb2023_selected <- clean_year(here("data", "raw", "kwb2023_raw.csv"), 2023)
kwb2024_selected <- clean_year(here("data", "raw", "kwb2024_raw.csv"), 2024)
kwb2025_selected <- clean_year(here("data", "raw", "kwb2025_raw.csv"), 2025)


# Combine all years ----

municipal_housing <- bind_rows(
  kwb2020_selected,
  kwb2021_selected,
  kwb2022_selected,
  kwb2023_selected,
  kwb2024_selected,
  kwb2025_selected
)

# Control steps
table(municipal_housing$year)
sum(duplicated(paste(municipal_housing$year, municipal_housing$gwb_code)))
colSums(is.na(municipal_housing))


# Create extra variables ----

municipal_housing$housing_pressure         <- municipal_housing$a_hh / municipal_housing$a_woning
municipal_housing$effective_housing_stock  <- municipal_housing$a_woning * (1 - municipal_housing$p_leegsw / 100)
municipal_housing$vacancy_adjusted_pressure <- municipal_housing$a_hh / municipal_housing$effective_housing_stock
municipal_housing$rental_vulnerability     <- municipal_housing$p_huurw - municipal_housing$p_wcorpw
municipal_housing$paradox_index            <- municipal_housing$housing_pressure * municipal_housing$p_leegsw

municipal_housing$urbanity_label <- NA
municipal_housing$urbanity_label[municipal_housing$ste_mvs == 1] <- "Very strongly urban"
municipal_housing$urbanity_label[municipal_housing$ste_mvs == 2] <- "Strongly urban"
municipal_housing$urbanity_label[municipal_housing$ste_mvs == 3] <- "Moderately urban"
municipal_housing$urbanity_label[municipal_housing$ste_mvs == 4] <- "Slightly urban"
municipal_housing$urbanity_label[municipal_housing$ste_mvs == 5] <- "Non-urban"

national_median_woz <- median(municipal_housing$g_wozbag, na.rm = TRUE)
municipal_housing$price_pressure <- municipal_housing$g_wozbag / national_median_woz


# Save clean dataset ----

write.csv(
  municipal_housing,
  here("data", "clean", "CLEANED_municipal_housing_2020_2025.csv"),
  row.names = FALSE
)

mdf <- read.csv(here("data", "clean", "CLEANED_municipal_housing_2020_2025.csv"))