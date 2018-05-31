#' Inferring trajectories with Control: error
#'
#' This control method will always produce an error.
#'
#' @param dummy_param This parameter does not do anything.
#'
#' @export
ti_error <- create_ti_method(
  name = "Control: error",
  short_name = "error",
  package_loaded = c(),
  package_required = c(),
  par_set = makeParamSet(
    makeNumericParam(id = "dummy_param", lower = 0, default = 0.5, upper = 1)
  ),
  run_fun = "dynmethods::run_error",
  plot_fun = dynplot::plot_default
)

run_error <- function(counts, dummy_param) {
  stop("This control method always errors.")
}
