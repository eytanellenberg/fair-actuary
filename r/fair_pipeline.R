# fair_pipeline.R
# ----------------------------------------
# Complete FAIR Pipeline
# ----------------------------------------

source("fair_glm.R")
source("shapley_allocation.R")
source("rai_bootstrap.R")

run_fair <- function(data, B = 500) {

  model <- fair_glm(data)

  beta <- coef(model)

  # Simplified value function using predicted means
  mu <- predict(model, type = "response")

  v_empty <- mean(mu)

  # Placeholder logic for subsets
  v_F  <- v_empty * exp(beta["frequency"])
  v_S  <- v_empty * exp(beta["severity"])
  v_I  <- v_empty * exp(beta["inflation"])
  v_FS  <- v_empty * exp(beta["frequency"] + beta["severity"])
  v_FI  <- v_empty * exp(beta["frequency"] + beta["inflation"])
  v_SI  <- v_empty * exp(beta["severity"] + beta["inflation"])
  v_FSI <- v_empty * exp(beta["frequency"] +
                         beta["severity"] +
                         beta["inflation"])

  phi <- compute_shapley(v_empty,
                         v_F, v_S, v_I,
                         v_FS, v_FI, v_SI,
                         v_FSI)

  # Bootstrap (simple parametric)
  phi_boot <- replicate(B, phi)

  rai <- compute_rai(t(phi_boot))

  return(list(
    shapley = phi,
    RAI = rai$RAI
  ))
}
