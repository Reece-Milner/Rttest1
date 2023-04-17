#' @title print
#'
#' @param x Object to print
#' @param ... Extra inputs
#' @importFrom stats t.test
#' @import knitr
#'
#' @return The data frame of the Rttest object
#' @export
#'
#' @examples
#' \dontrun{print(obj)}
print.Rttest <- function(x, ...) {
  #library(kableExtra)
  knitr::kable(x[[1]], format = "markdown")
}

