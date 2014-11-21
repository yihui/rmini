## how to document datasets: you need to specify @docType and @name; do not
## forget NULL in the end

#' Some random data
#'
#' A few numbers from \code{rnorm()}.
#' @docType data
#' @name hiNorm
#' @format A numeric vector.
#' @source Generated from \code{set.seed(123); rnorm(10)}
#' @examples data(hiNorm)
#' str(hiNorm)
NULL
