#' @title plot
#'
#' @param x Object to plot
#' @param ... Extra inputs
#' @import ggplot2
#' @import dplyr
#'
#' @return the plot
#' @export
#'
#' @examples
#' \dontrun{plot(obj)}
plot.Rttest <- function(x, ...) {
  column <- NULL
  v1 <- NULL
  v2 <- NULL
  value <- NULL
  plot(ggplot(data = rbind(x[[1]] %>%
                             rename(value = v1) %>%
                             mutate(column = "v1") %>%
                             select(column, value),
                           x[[1]] %>%
                             rename(value = v2) %>%
                             mutate(column = "v2") %>%
                             select(column, value))) +
         geom_boxplot(aes(x = column, y = value)))
}
