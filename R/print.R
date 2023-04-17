#' @title print
#'
#' @param x Object to print
#'
#' @return The data frame of the Rttest object
#'
#' @export print.Rttest
#'
#' @examples
#' \dontrun{print(obj)}
print.Rttest <- function(x) {
  library(kableExtra)
  knitr::kable(x[[1]], format = "markdown")
}

