% Please edit documentation in R/S3.R
\name{+.Foo}
\alias{+.Foo}
\title{Add a new element to a list}
\usage{
\method{+}{Foo}(x, y)
}
\arguments{
\item{x}{a list with class \code{Foo}}

\item{y}{an arbitrary R object}
}
\value{
A list with \code{y} being added to \code{x} as its last element.
}
\description{
This is an S3 generic function for \code{+} with the class \code{Foo}.
}
\examples{
structure(list(1), class = "Foo") + 2

z = list("a")
class(z) = "Foo"
z + letters
z + 5 + matrix(1:4, 2)  # you can add arbitrary objects to z

methods("+")  # check the methods on +
}
\author{
Yihui Xie <\url{http://yihui.name}>
}
