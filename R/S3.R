## examples of S3 functions

#' An S3 generic function example
#' 
#' Say hello on difference classes.
#' @param x an arbitrary R object
#' @return The class of \code{x} is printed as a side-effect.
#' @export
#' @S3method hello character
#' @S3method hello default
#' @examples hello(1)
#' hello('a')
#' hello(structure(1, class = 'world'))
hello = function(x) {
  UseMethod('hello')
}

# default method

#' @method hello default
#' @rdname hello
hello.default = function(x) {
  cat('hello,', class(x), '\n')
}

#' @method hello character
#' @rdname hello
hello.character = function(x) {
  cat('Hi! I love characters!\n')
}


## define S3 methods on existing functions, e.g. +

#' Add a new element to a list
#' 
#' This is an S3 generic function for \code{+} with the class \code{Foo}.
#' @param x a list with class \code{Foo}
#' @param y an arbitrary R object
#' @export
#' @method + Foo
#' @return A list with \code{y} being added to \code{x} as its last element.
#' @rdname add_list
#' @author Yihui Xie <\url{http://yihui.name}>
#' @examples structure(list(1), class='Foo') + 2
#'
#' z = list('a'); class(z) = 'Foo'
#' z+letters
#' z+5+matrix(1:4,2) # you can add arbitrary objects to z
#' 
#' methods('+') # check the methods on +
`+.Foo` = function(x, y) {
  stopifnot(is.list(x))
  n = length(x)
  x[[n + 1L]] = y
  x
}
