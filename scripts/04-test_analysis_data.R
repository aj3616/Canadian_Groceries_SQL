#### Preamble ####
# Purpose: Tests the structure and validity of the uploaded CSV files.
# Author: Amy Jin
# Date: 2024.11.12
# Contact: amyzh.jin@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - The `tidyverse` package must be installed and loaded
# - CSV files `temp.brand_price_differences.csv` and `temp.vendor_brand_pricing.csv` must be present

#### Workspace setup ####
library(tidyverse)

# Load the data
brand_price_differences <- read_csv("/mnt/data/temp.brand_price_differences.csv")
vendor_brand_pricing <- read_csv("/mnt/data/temp.vendor_brand_pricing.csv")

#### Test brand_price_differences ####

# Test if the data was successfully loaded
if (exists("brand_price_differences")) {
  message("Test Passed: brand_price_differences dataset was successfully loaded.")
} else {
  stop("Test Failed: brand_price_differences dataset could not be loaded.")
}

# Check required columns
required_columns_bpd <- c("brand", "vendor1", "vendor2", "price_difference", "unit_price_difference")
if (all(required_columns_bpd %in% colnames(brand_price_differences))) {
  message("Test Passed: brand_price_differences contains all required columns.")
} else {
  stop("Test Failed: brand_price_differences is missing required columns.")
}

# Check if price_difference and unit_price_difference are numeric
if (all(sapply(brand_price_differences[ , c("price_difference", "unit_price_difference")], is.numeric))) {
  message("Test Passed: price_difference and unit_price_difference are numeric.")
} else {
  stop("Test Failed: price_difference or unit_price_difference is not numeric.")
}

# Check for missing values
if (all(!is.na(brand_price_differences))) {
  message("Test Passed: brand_price_differences contains no missing values.")
} else {
  stop("Test Failed: brand_price_differences contains missing values.")
}

#### Test vendor_brand_pricing ####

# Test if the data was successfully loaded
if (exists("vendor_brand_pricing")) {
  message("Test Passed: vendor_brand_pricing dataset was successfully loaded.")
} else {
  stop("Test Failed: vendor_brand_pricing dataset could not be loaded.")
}

# Check required columns
required_columns_vbp <- c("vendor", "brand", "avg_current_price", "avg_price_per_unit", "product_count")
if (all(required_columns_vbp %in% colnames(vendor_brand_pricing))) {
  message("Test Passed: vendor_brand_pricing contains all required columns.")
} else {
  stop("Test Failed: vendor_brand_pricing is missing required columns.")
}

# Check if avg_current_price, avg_price_per_unit, and product_count are numeric
if (all(sapply(vendor_brand_pricing[ , c("avg_current_price", "avg_price_per_unit", "product_count")], is.numeric))) {
  message("Test Passed: avg_current_price, avg_price_per_unit, and product_count are numeric.")
} else {
  stop("Test Failed: One or more numeric columns are not numeric.")
}

# Check for missing values
if (all(!is.na(vendor_brand_pricing))) {
  message("Test Passed: vendor_brand_pricing contains no missing values.")
} else {
  stop("Test Failed: vendor_brand_pricing contains missing values.")
}

# Check for valid vendor names
valid_vendors <- c("Galleria", "Loblaws", "Metro", "NoFrills", "SaveOnFoods", "TandT", "Voila", "Walmart")
if (all(vendor_brand_pricing$vendor %in% valid_vendors)) {
  message("Test Passed: vendor_brand_pricing contains only valid vendor names.")
} else {
  stop("Test Failed: vendor_brand_pricing contains invalid vendor names.")
}
