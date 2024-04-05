library(rstanarm)

# For this example, let's simplify the model to not include Cancer Type
simple_data <- data.frame(
  Year = rep(2004:2023, times=5),
  Deaths = rnorm(100, mean=1000, sd=200)
)

# Fit a Bayesian linear regression model
fit <- stan_glm(Deaths ~ Year, data=simple_data, family=gaussian())

print(fit)

saveRDS(
  fit,
  file = "models/first_model.rds"
)