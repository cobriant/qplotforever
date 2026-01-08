#' qplot (without the ggplot2 lifecycle deprecation warning)
#'
#' Pedagogical wrapper around ggplot2::qplot() that muffles only the
#' lifecycle deprecation warning for qplot, while keeping all other
#' warnings and messages.
#'
#' @param ... Passed on to ggplot2::qplot().
#' @inheritParams ggplot2::qplot
#' @return A ggplot object.
#' @export
qplot <- function(...) {
  withCallingHandlers(
    ggplot2::qplot(...),
    warning = function(w) {
      msg <- conditionMessage(w)

      is_lifecycle_deprecation <-
        inherits(w, "lifecycle_warning") ||
        inherits(w, "lifecycle_warning_deprecated") ||
        inherits(w, "rlang_warning") # sometimes lifecycle warnings inherit via rlang

      is_qplot_deprecation <- grepl("^`qplot\\(\\)` was deprecated", msg)

      if (is_lifecycle_deprecation && is_qplot_deprecation) {
        invokeRestart("muffleWarning")
      }
    }
  )
}
