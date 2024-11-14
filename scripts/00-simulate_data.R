#### Preamble ####
# Purpose: Simulates a dataset of grocery product information, including vendors, brands, and pricing.
# Author: [Your Name]
# Date: [Today's Date]
# Contact: [Your Contact Information]
# License: MIT
# Pre-requisites: The `tidyverse` package must be installed
# Any other information needed? Make sure you are in the `starter_folder` rproj

#### Workspace setup ####
library(tidyverse)
set.seed(56)

#### Simulate data ####
# Vendor names
vendors <- c("Galleria", "Loblaws", "Metro", "NoFrills", "SaveOnFoods", "TandT", "Voila", "Walmart")

# Brand names
brands <- c("Dempster's", "Wonder", "Country Harvest", "Villaggio", "Sunbeam", "Stonemill", "Sara Lee", "Silver Hills")

# Product names
products <- c("Whole Wheat Bread", "Multigrain Bread", "White Bread", "Sourdough Bread")

# Generate random product data
grocery_data <- tibble(
  product_id = 1:100,  # Unique product IDs
  vendor = sample(
    vendors,
    size = 100,
    replace = TRUE,
    prob = c(0.15, 0.15, 0.15, 0.15, 0.1, 0.1, 0.1, 0.1) # Vendor distribution
  ),
  brand = sample(
    brands,
    size = 100,
    replace = TRUE,
    prob = c(0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125, 0.125) # Equal brand distribution
  ),
  product_name = sample(
    products,
    size = 100,
    replace = TRUE
  ),
  current_price = round(runif(100, 1.50, 5.00), 2),  # Prices between $1.50 and $5.00
  old_price = round(runif(100, 1.50, 6.00), 2),  # Prices between $1.50 and $6.00
  price_per_unit = round(current_price / runif(100, 1, 2), 2)  # Price per unit
)

#### Save data ####
write_csv(grocery_data, "data/00-simulated_data/simulated_grocery_data.csv")
