#' qplot (without the ggplot2 lifecycle deprecation warning)
#'
#' Pedagogical wrapper around ggplot2::qplot() that suppresses the
#' lifecycle deprecation warning for qplot only.
#'
#' @param ... Passed on to ggplot2::qplot().
#' @inheritParams ggplot2::qplot
#' @return A ggplot object.
#' @export
qplot <- function(...) {
  lifecycle::local_lifecycle_warnings(NULL)

  ggplot2::qplot(...)
}
