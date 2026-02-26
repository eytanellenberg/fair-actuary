# fair_glm.R
# ----------------------------------------
# GLM Association Layer for FAIR Actuary
# ----------------------------------------

fair_glm <- function(data,
                     response = "incremental_paid",
                     freq_var = "frequency",
                     sev_var  = "severity",
                     infl_var = "inflation") {

  formula <- as.formula(
    paste(response,
          "~",
          paste(c(freq_var, sev_var, infl_var), collapse = " + "))
  )

  model <- glm(formula,
               data = data,
               family = gaussian(link = "log"))

  return(model)
}
