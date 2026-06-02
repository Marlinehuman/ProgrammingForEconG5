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



# Decide relevant variables regarding research objective ----



