\name{hello}
\alias{hello}
\alias{hello.character}
\alias{hello.default}
\title{An S3 generic function example}
\usage{
hello(x)

\method{hello}{default}(x)

\method{hello}{character}(x)
}
\arguments{
  \item{x}{an arbitrary R object}
}
\value{
  The class of \code{x} is printed as a side-effect.
}
\description{
  Say hello on difference classes.
}
\examples{
hello(1)
hello("a")
hello(structure(1, class = "world"))
}
