## this shows you how to write roxygen comments

#' First line is title
#'
#' This is a brief description.
#'
#' Anything else after the description goes to the Details section.
#'
#' You can write several paragraphs.
#' @param x explanation of \code{x}
#' @param ... explanation of \code{...}
#' @return The value returned by this function.
#' @author Who are you?
#' @seealso \code{\link[tools]{file_ext}}, \code{\link[tools]{file_path_sans_ext}}
#' @references \url{https://github.com/yihui/rmini}
#' @importFrom tools file_ext file_path_sans_ext
#' @export
#' @examples split_filename('foo.bar')
split_filename = function(x, ...) {
  c(file_path_sans_ext(x, ...), file_ext(x))
}


## you do not need to export all objects

#' Scrolling letters
#'
#' Nothing fancy.
#' @param n length of letters
#' @return The last vector of letters.
#' @export
#' @examples library(rmini); rock_fun(); rock_fun(50)
#' # you can call unexported functions with ::: but it is not recommended
#' # because package authors may not want you to go into their backyards
#' rmini:::add_one(c('a', 'b', 'c'))
rock_fun = function(n = 20) {
  x = sample(letters, n, replace = n > length(letters))
  for (i in 1:100) {
    cat(x, '\r', sep = '')
    x = add_one(x)
    Sys.sleep(.1)
  }
  invisible(x)
}

# this function is for internal use only, so no need to export it
add_one = function(v) c(v[-1], sample(letters, 1))
