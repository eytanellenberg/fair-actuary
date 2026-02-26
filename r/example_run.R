source("fair_pipeline.R")

# Fake minimal dataset
set.seed(1)

data <- data.frame(
  incremental_paid = exp(rnorm(200, 10, 0.3)),
  frequency = rnorm(200, 0, 1),
  severity = rnorm(200, 0, 1),
  inflation = rnorm(200, 0, 1)
)

result <- run_fair(data, B = 200)

print(result)
