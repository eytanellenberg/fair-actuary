# -------------------------------------------------------
# FAIR Actuary — Example Run Script
# -------------------------------------------------------
# Minimal reproducible example of the FAIR pipeline
# -------------------------------------------------------

# Load FAIR components
source("fair_glm.R")
source("shapley_allocation.R")
source("rai_bootstrap.R")
source("fair_pipeline.R")

set.seed(123)

# -------------------------------------------------------
# Generate synthetic separable dataset
# -------------------------------------------------------

n <- 300

data <- data.frame(
  frequency = rnorm(n, 0, 1),
  severity  = rnorm(n, 0, 1),
  inflation = rnorm(n, 0, 1)
)

# Construct multiplicative log-linear structure
true_beta <- c(
  frequency = 0.30,
  severity  = 0.60,
  inflation = 0.15
)

data$incremental_paid <- exp(
  10 +
  true_beta["frequency"] * data$frequency +
  true_beta["severity"]  * data$severity +
  true_beta["inflation"] * data$inflation +
  rnorm(n, 0, 0.2)
)

# -------------------------------------------------------
# Run FAIR pipeline
# -------------------------------------------------------

result <- run_fair(data, B = 300)

cat("\n--- FAIR Actuary Results ---\n")
print(result$shapley)

cat("\nRisk Attribution Index (RAI):\n")
print(result$RAI)

# -------------------------------------------------------
# Interpretation Guide
# -------------------------------------------------------
cat("\nInterpretation:\n")
cat("Low RAI (< 0.5) indicates structural separability.\n")
cat("High RAI (> 0.5) indicates attribution instability.\n")
