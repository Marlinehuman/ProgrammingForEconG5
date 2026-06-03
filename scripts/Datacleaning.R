# Installing packages which will be used. ----

install.packages(c(
  "here",
  "readxl",
  "readr",
  "dplyr",
  "janitor",
  "tidyr",
  "ggplot2",
  "stringr"
))

# Add packages to this session ----

library(here)
library(readxl)
library(readr)
library(dplyr)
library(janitor)
library(tidyr)


# Import the Excel files for the years: 2020-2026

# 2020 ----

## Read Excel

kwb2020raw <- read_excel("kwb-2020.xlsx", 
                         sheet = 1, 
                         na = c(".", "", "NA"))

## Clean columnnames

kwb2020raw <- clean_names(kwb2020raw)

## Check variables 

names(kwb2020raw)
View(kwb2020raw)
count(kwb2020raw)

## Save as csv raw

write_csv(
  kwb2020raw,
  "kwb2020_raw.csv"
)

# 2021 ----

## Read Excel

kwb2021raw <- read_excel("kwb-2021.xlsx", 
                         sheet = 1, 
                         na = c(".", "", "NA"))
## Clean columnnames

kwb2021raw <- clean_names(kwb2021raw)

## Check variables 

names(kwb2021raw)
View(kwb2021raw)
count(kwb2021raw)

## Save as csv raw

write_csv(
  kwb2021raw,
  "kwb2021_raw.csv")

# 2022 ----

## Read Excel

kwb2022raw <- read_excel("kwb-2022.xlsx", 
                         sheet = 1, 
                         na = c(".", "", "NA"))
## Clean columnnames

kwb2022raw <- clean_names(kwb2022raw)

## Check variables 

names(kwb2022raw)
View(kwb2022raw)
count(kwb2022raw)

## Save as csv raw

write_csv(
  kwb2022raw,
  "kwb2022_raw.csv")

# 2023 ----

## Read Excel

kwb2024raw <- read_excel("kwb2023.xlsx", 
                         sheet = 1, 
                         na = c(".", "", "NA"))
## Clean columnnames

kwb2024raw <- clean_names(kwb2023raw)

## Check variables 

names(kwb2023raw)
View(kwb2023raw)
count(kwb2023raw)

## Save as csv raw

write_csv(
  kwb2023raw,
  "kwb2023_raw.csv")

# 2024 ----

## Read Excel

kwb2024raw <- read_excel("kwb2024.xlsx", 
                         sheet = 1, 
                         na = c(".", "", "NA"))
## Clean columnnames

kwb2024raw <- clean_names(kwb2024raw)

## Check variables 
names(kwb2024raw)
View(kwb2024raw)
count(kwb2024raw)

## Save as csv raw

write_csv(
  kwb2024raw,
  "kwb2024_raw.csv")


# 2025 ----

## Read Excel

kwb2025raw <- read_excel("kwb2025.xlsx", 
                         sheet = 1, 
                         na = c(".", "", "NA"))
## Clean columnnames

kwb2025raw <- clean_names(kwb2025raw)

## Check variables 

names(kwb2025raw)
View(kwb2025raw)
count(kwb2025raw)

## Save as csv raw

write_csv(
  kwb2025raw,
  "kwb2025_raw.csv")


#ID variables ----

  #year      = jaar, 2020 t/m 2025
  #gm_naam   = gemeentenaam
  #recs      = soort regio, dus Gemeente/Wijk/Buurt
  #gwb_code  = gemeentecode

#Other variables ----

selected_vars <- c(
  "year",
  "gwb_code",
  "gm_naam",
  "recs",
  "a_woning",
  "a_hh",
  "p_leegsw",
  "g_wozbag",
  "p_koopw",
  "p_huurw",
  "p_wcorpw",
  "p_ov_hw",
  "ste_mvs",
  "bev_dich",
  "a_inw")
  
#Cleaning 2020 ----

# Open csv raw 2020

kwb2020 <- read_csv("kwb2020_raw.csv",
  na = c(".", "", "NA"),
  show_col_types = FALSE)

# Filter on municipality basis

kwb2020_municipalities <- kwb2020[kwb2020$recs == "Gemeente", ]

# Check if there are no double municipalities (through gwb_code)

sum(duplicated(kwb2020_municipalities$gwb_code))

# Add identifying year variable (2020)

kwb2020_municipalities$year <- 2020

# Filtering out unrelated variables

available_vars <- selected_vars[selected_vars %in% names(kwb2020_municipalities)]
kwb2020_selected <- kwb2020_municipalities[, available_vars]

summary(kwb2020_selected)

# Adjust g_wozbag to scale

kwb2020_selected$g_wozbag <- kwb2020_selected$g_wozbag * 1000

# Save as clean 

write_csv(kwb2020_selected, "kwb2020_clean.csv")

  












#Cleaning 2021 ----

# Open csv raw 2021

kwb2021 <- read_csv("kwb2021_raw.csv",
                    na = c(".", "", "NA"),
                    show_col_types = FALSE)

# Filter on municipality basis

kwb2021_municipalities <- kwb2021[kwb2021$recs == "Gemeente", ]

# Check if there are no double municipalities (through gwb_code)

sum(duplicated(kwb2021_municipalities$gwb_code))

# Add identifying year variable (2021)

kwb2021_municipalities$year <- 2021

# Filtering out unrelated variables

available_vars <- selected_vars[selected_vars %in% names(kwb2021_municipalities)]
kwb2021_selected <- kwb2021_municipalities[, available_vars]

summary(kwb2021_selected)

# Adjust g_wozbag to scale

kwb2021_selected$g_wozbag <- kwb2021_selected$g_wozbag * 1000

# Save as clean 

write_csv(kwb2021_selected, "kwb2021_clean.csv") 

#Cleaning 2022 ----

# Open csv raw 2022

kwb2022 <- read_csv("kwb2022_raw.csv",
                    na = c(".", "", "NA"),
                    show_col_types = FALSE)

# Filter on municipality basis

kwb2022_municipalities <- kwb2022[kwb2022$recs == "Gemeente", ]

# Check if there are no double municipalities (through gwb_code)

sum(duplicated(kwb2022_municipalities$gwb_code))

# Add identifying year variable (2020)

kwb2022_municipalities$year <- 2022

# Filtering out unrelated variables

available_vars <- selected_vars[selected_vars %in% names(kwb2022_municipalities)]
kwb2022_selected <- kwb2022_municipalities[, available_vars]

summary(kwb2022_selected)

# Adjust g_wozbag to scale

kwb2022_selected$g_wozbag <- kwb2022_selected$g_wozbag * 1000

# Save as clean 

write_csv(kwb2022_selected, "kwb2022_clean.csv")

#Cleaning 2023 ----

# Open csv raw 2023

kwb2023 <- read_csv("kwb2023_raw.csv",
                    na = c(".", "", "NA"),
                    show_col_types = FALSE)

# Filter on municipality basis

kwb2023_municipalities <- kwb2023[kwb2023$recs == "Gemeente", ]

# Check if there are no double municipalities (through gwb_code)

sum(duplicated(kwb2023_municipalities$gwb_code))

# Add identifying year variable (2020)

kwb2023_municipalities$year <- 2023

# Filtering out unrelated variables

available_vars <- selected_vars[selected_vars %in% names(kwb2023_municipalities)]
kwb2023_selected <- kwb2023_municipalities[, available_vars]

summary(kwb2023_selected)

# Adjust g_wozbag to scale

kwb2023_selected$g_wozbag <- kwb2023_selected$g_wozbag * 1000

# Save as clean 

write_csv(kwb2023_selected, "kwb2023_clean.csv")

#Cleaning 2024 ----

# Open csv raw 2024

kwb2024 <- read_csv("kwb2024_raw.csv",
                    na = c(".", "", "NA"),
                    show_col_types = FALSE)

# Filter on municipality basis

kwb2024_municipalities <- kwb2024[kwb2024$recs == "Gemeente", ]

# Check if there are no double municipalities (through gwb_code)

sum(duplicated(kwb2024_municipalities$gwb_code))

# Add identifying year variable (2020)

kwb2024_municipalities$year <- 2024

# Filtering out unrelated variables

available_vars <- selected_vars[selected_vars %in% names(kwb2024_municipalities)]
kwb2024_selected <- kwb2024_municipalities[, available_vars]

summary(kwb2024_selected)

# Adjust g_wozbag to scale

kwb2024_selected$g_wozbag <- kwb2024_selected$g_wozbag * 1000

# Save as clean 

write_csv(kwb2024_selected, "kwb2024_clean.csv")

#Cleaning 2025 ----

# Open csv raw 2025

kwb2025 <- read_csv("kwb2025_raw.csv",
                    na = c(".", "", "NA"),
                    show_col_types = FALSE)

# Filter on municipality basis

kwb2025_municipalities <- kwb2025[kwb2025$recs == "Gemeente", ]

# Check if there are no double municipalities (through gwb_code)

sum(duplicated(kwb2025_municipalities$gwb_code))

# Add identifying year variable (2025)

kwb2025_municipalities$year <- 2025

# Filtering out unrelated variables

available_vars <- selected_vars[selected_vars %in% names(kwb2025_municipalities)]
kwb2025_selected <- kwb2025_municipalities[, available_vars]

summary(kwb2025_selected)

# Adjust g_wozbag to scale

kwb2025_selected$g_wozbag <- kwb2025_selected$g_wozbag * 1000

# Save as clean 

write_csv(kwb2025_selected, "kwb2025_clean.csv")
