# rai_bootstrap.R
# ----------------------------------------
# Risk Attribution Index
# ----------------------------------------

compute_rai <- function(phi_matrix) {

  # phi_matrix = B x 3 bootstrap matrix

  mean_phi <- colMeans(phi_matrix)

  between_var <- var(mean_phi)

  bootstrap_var <- mean(apply(phi_matrix, 2, var))

  rai <- bootstrap_var / (between_var + bootstrap_var)

  return(list(
    RAI = rai,
    between_variance = between_var,
    bootstrap_variance = bootstrap_var
  ))
}
