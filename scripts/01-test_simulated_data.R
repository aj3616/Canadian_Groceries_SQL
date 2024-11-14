#### Preamble ####
# Purpose: Tests the structure and validity of the simulated grocery dataset.
# Author: Amy Jin
# Date: 2024.11.14
# Contact: amyzh.jin@mail.utoronto.ca
# License: MIT
# Pre-requisites: 
# - The `tidyverse` package must be installed and loaded
# - The grocery data simulation script must have been run
# Any other information needed? Make sure you are in the `starter_folder` rproj

#### Workspace setup ####
library(tidyverse)

grocery_data <- read_csv("data/00-simulated_data/simulated_grocery_data.csv")

# Test if the data was successfully loaded
if (exists("grocery_data")) {
  message("Test Passed: The dataset was successfully loaded.")
} else {
  stop("Test Failed: The dataset could not be loaded.")
}

#### Test data ####

# Check if the dataset has 100 rows
if (nrow(grocery_data) == 100) {
  message("Test Passed: The dataset has 100 rows.")
} else {
  stop("Test Failed: The dataset does not have 100 rows.")
}

# Check if the dataset has 7 columns
if (ncol(grocery_data) == 7) {
  message("Test Passed: The dataset has 7 columns.")
} else {
  stop("Test Failed: The dataset does not have 7 columns.")
}

# Check if all values in the 'product_id' column are unique
if (n_distinct(grocery_data$product_id) == nrow(grocery_data)) {
  message("Test Passed: All values in 'product_id' are unique.")
} else {
  stop("Test Failed: The 'product_id' column contains duplicate values.")
}

# Check if the 'vendor' column contains only valid vendor names
valid_vendors <- c("Galleria", "Loblaws", "Metro", "NoFrills", "SaveOnFoods", "TandT", "Voila", "Walmart")

if (all(grocery_data$vendor %in% valid_vendors)) {
  message("Test Passed: The 'vendor' column contains only valid vendor names.")
} else {
  stop("Test Failed: The 'vendor' column contains invalid vendor names.")
}

# Check if the 'brand' column contains only valid brand names
valid_brands <- c("Dempster's", "Wonder", "Country Harvest", "Villaggio", "Sunbeam", "Stonemill", "Sara Lee", "Silver Hills")

if (all(grocery_data$brand %in% valid_brands)) {
  message("Test Passed: The 'brand' column contains only valid brand names.")
} else {
  stop("Test Failed: The 'brand' column contains invalid brand names.")
}

# Check if there are any missing values in the dataset
if (all(!is.na(grocery_data))) {
  message("Test Passed: The dataset contains no missing values.")
} else {
  stop("Test Failed: The dataset contains missing values.")
}

# Check if there are no empty strings in 'vendor', 'brand', 'product_name'
if (all(grocery_data$vendor != "" & grocery_data$brand != "" & grocery_data$product_name != "")) {
  message("Test Passed: There are no empty strings in 'vendor', 'brand', or 'product_name'.")
} else {
  stop("Test Failed: There are empty strings in one or more columns.")
}

# Check if 'current_price' and 'old_price' are numeric and within expected ranges
if (all(is.numeric(grocery_data$current_price) & grocery_data$current_price >= 1.50 & grocery_data$current_price <= 5.00)) {
  message("Test Passed: 'current_price' is numeric and within the expected range.")
} else {
  stop("Test Failed: 'current_price' is not numeric or out of range.")
}

if (all(is.numeric(grocery_data$old_price) & grocery_data$old_price >= 1.50 & grocery_data$old_price <= 6.00)) {
  message("Test Passed: 'old_price' is numeric and within the expected range.")
} else {
  stop("Test Failed: 'old_price' is not numeric or out of range.")
}

# Check if 'price_per_unit' is numeric
if (all(is.numeric(grocery_data$price_per_unit))) {
  message("Test Passed: 'price_per_unit' is numeric.")
} else {
  stop("Test Failed: 'price_per_unit' is not numeric.")
}
