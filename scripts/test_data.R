library(tidyverse)
library(testthat)
library(reader)

data <- read_csv("simulated_cancer_deaths_data.csv")

# Test 1: No missing values
test_that("data has no missing values", {
  expect_true(sum(is.na(data)) == 0)
})

# Test 2: Correct hospital names
test_that("hospital names are correct", {
  expected_names <- paste0("Hospital ", LETTERS[1:5])
  expect_subset(unique(data$HospitalName), expected_names)
})

# Test 3: Year range is correct
test_that("year range is correct", {
  expect_true(all(data$Year >= 2004 & data$Year <= 2023))
})

# Test 4: Correct cancer types
test_that("cancer types are correct", {
  expected_types <- c('Lung', 'Breast', 'Prostate', 'Colorectal')
  expect_subset(unique(data$CancerType), expected_types)
})

# Test 5: Valid age groups
test_that("age groups are valid", {
  expected_groups <- c('0-18', '19-35', '36-50', '51-65', '66+')
  expect_subset(unique(data$AgeGroup), expected_groups)
})

# Test 6: Gender categories are correct
test_that("gender categories are correct", {
  expected_genders <- c('Male', 'Female', 'Other')
  expect_subset(unique(data$Gender), expected_genders)
})

# Test 7: Deaths are within a plausible range
test_that("deaths are in a plausible range", {
  expect_true(all(data$Deaths >= 1 & data$Deaths <= 200))
})

# Test 8: Data types are correct
test_that("data types are correct", {
  expect_is(data$HospitalName, "character")
  expect_is(data$Year, "integer")
  expect_is(data$CancerType, "character")
  expect_is(data$AgeGroup, "character")
  expect_is(data$Gender, "character")
  expect_is(data$Deaths, "integer")
})

# Test 9: The dataset contains the expected number of records
test_that("dataset contains the expected number of records", {
  expect_equal(nrow(data), 1000)
})

# Test 10: Check for duplicates
test_that("no duplicate records are present", {
  expect_equal(nrow(data), nrow(unique(data)))
})