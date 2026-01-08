#' qplot (teaching wrapper)
#'
#' Pedagogical wrapper around ggplot2::qplot() that suppresses lifecycle
#' deprecation warnings during the call, while leaving other warnings alone.
#'
#' @param ... Passed on to ggplot2::qplot().
#' @inheritParams ggplot2::qplot
#' @return A ggplot object.
#' @export
qplot <- function(...) {
  old <- getOption("lifecycle_verbosity", default = NULL)
  options(lifecycle_verbosity = "quiet")
  on.exit(options(lifecycle_verbosity = old), add = TRUE)

  ggplot2::qplot(...)
}
