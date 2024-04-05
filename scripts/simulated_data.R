set.seed(302)  

n_years <- 20
start_year <- 2004
n_hospitals <- 5
n_records <- 1000
cancer_types <- c('Lung', 'Breast', 'Prostate', 'Colorectal')
age_groups <- c('0-18', '19-35', '36-50', '51-65', '66+')
genders <- c('Male', 'Female', 'Other')

# Simulate data
data <- data.frame(
  HospitalName = sample(paste0("Hospital ", LETTERS[1:n_hospitals]), n_records, replace = TRUE),
  Year = sample(start_year:(start_year + n_years - 1), n_records, replace = TRUE),
  CancerType = sample(cancer_types, n_records, replace = TRUE),
  AgeGroup = sample(age_groups, n_records, replace = TRUE),
  Gender = sample(genders, n_records, replace = TRUE),
  Deaths = sample(1:200, n_records, replace = TRUE)
)

# Save the dataset
write.csv(data, "simulated_cancer_deaths_data.csv")