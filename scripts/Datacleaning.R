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

# Add packages. ----

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

kwb2023raw <- read_excel("kwb2023.xlsx", 
                         sheet = 1, 
                         na = c(".", "", "NA"))
## Clean columnnames

kwb2023raw <- clean_names(kwb2023raw)

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

# Grouping all clean datasets into one big dataset ----

# Loading clean sets into R

kwb2020_clean <- read.csv("kwb2020_clean.csv")
kwb2021_clean <- read.csv("kwb2021_clean.csv")
kwb2022_clean <- read.csv("kwb2022_clean.csv")
kwb2023_clean <- read.csv("kwb2023_clean.csv")
kwb2024_clean <- read.csv("kwb2024_clean.csv")
kwb2025_clean <- read.csv("kwb2025_clean.csv")

# Combine all years into one final dataset

municipal_housing <- rbind(
  kwb2020_clean,
  kwb2021_clean,
  kwb2022_clean,
  kwb2023_clean,
  kwb2024_clean,
  kwb2025_clean
)

# Control steps

View(municipal_housing)
table(municipal_housing$year)
sum(duplicated(paste(municipal_housing$year, municipal_housing$gwb_code)))
colSums(is.na(municipal_housing))

# Create extra variables

#housing_pressure = households / houses
#effective_housing_stock = houses corrected for vacancy
#vacancy_adjusted_pressure = housing pressure after vacancy correction
#rental_vulnerability =  rental minus corporation houses
#paradox_index = housing pressure with vacancy
#urbanity_label = urbanity labels based on ste_mvs
#national_median_woz = median WOZ value of all municipalities across all years
#price_pressure = municipality WOZ value compared to the national median WOZ value
#price_pressure above 1 = municipality has above-median WOZ value
#price_pressure below 1 = municipality has below-median WOZ value


municipal_housing$housing_pressure <- municipal_housing$a_hh / municipal_housing$a_woning

municipal_housing$effective_housing_stock <- municipal_housing$a_woning * (1 - municipal_housing$p_leegsw / 100)

municipal_housing$vacancy_adjusted_pressure <- municipal_housing$a_hh / municipal_housing$effective_housing_stock

municipal_housing$rental_vulnerability <- municipal_housing$p_huurw - municipal_housing$p_wcorpw

municipal_housing$paradox_index <- municipal_housing$housing_pressure * municipal_housing$p_leegsw

municipal_housing$urbanity_label <- NA

municipal_housing$urbanity_label[municipal_housing$ste_mvs == 1] <- "Very strongly urban"
municipal_housing$urbanity_label[municipal_housing$ste_mvs == 2] <- "Strongly urban"
municipal_housing$urbanity_label[municipal_housing$ste_mvs == 3] <- "Moderately urban"
municipal_housing$urbanity_label[municipal_housing$ste_mvs == 4] <- "Slightly urban"
municipal_housing$urbanity_label[municipal_housing$ste_mvs == 5] <- "Non-urban"

national_median_woz <- median(municipal_housing$g_wozbag, na.rm = TRUE)

municipal_housing$price_pressure <- municipal_housing$g_wozbag / national_median_woz


# Save final clean analysis dataset ----

write.csv(
  municipal_housing,
  "CLEANED_municipal_housing_2020_2025.csv"
)

mdf = read.csv("CLEANED_municipal_housing_2020_2025.csv")

