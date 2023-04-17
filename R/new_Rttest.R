#' @title new_Rttest
#'
#' @param v1 First vector
#' @param v2 Second vector
#' @param alpha Alpha level
#'
#' @return A data frame of the vectors, the alpha level, the confidence intervals, and the p-value of a t-test
#' @export
#'
#' @examples
#' \dontrun{new_Rttest(v1 = x, v2 = y, alpha = 0.05)}
new_Rttest <- function(v1, v2, alpha) {

  # Create a data frame of the vectors regardless of lengths
  v.df <- merge(data.frame(v1, row.names = NULL),
                data.frame(v2, row.names = NULL),
                by = 0, all = TRUE)[-1]

  # Extract upper and lower confidence interval bounds for mean of each vector
  mu_conf_ints <- list(t.test(x = v1, conf.level = 1 - alpha)$conf.int[1],
                       t.test(x = v1, conf.level = 1 - alpha)$conf.int[2],
                       t.test(x = v2, conf.level = 1 - alpha)$conf.int[1],
                       t.test(x = v2, conf.level = 1 - alpha)$conf.int[2])

  # Extract p-value of t-test between vectors
  p_value <- t.test(x = v1, y = v2, conf.level = 1 - alpha)$p.value

  # Combine all outputs
  x <- list(v.df, alpha, mu_conf_ints, p_value)

  # Create the class of the constructor output
  structure(x,
            class = "Rttest")

}
