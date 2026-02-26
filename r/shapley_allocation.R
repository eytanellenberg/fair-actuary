# shapley_allocation.R
# ----------------------------------------
# Shapley Allocation for 3 Factors
# ----------------------------------------

compute_shapley <- function(v_empty,
                            v_F,
                            v_S,
                            v_I,
                            v_FS,
                            v_FI,
                            v_SI,
                            v_FSI) {

  phi_F <- (1/6) * (
    (v_F - v_empty) +
    (v_FS - v_S) +
    (v_FI - v_I) +
    (v_FSI - v_SI)
  )

  phi_S <- (1/6) * (
    (v_S - v_empty) +
    (v_FS - v_F) +
    (v_SI - v_I) +
    (v_FSI - v_FI)
  )

  phi_I <- (1/6) * (
    (v_I - v_empty) +
    (v_FI - v_F) +
    (v_SI - v_S) +
    (v_FSI - v_FS)
  )

  return(c(F = phi_F,
           S = phi_S,
           I = phi_I))
}
