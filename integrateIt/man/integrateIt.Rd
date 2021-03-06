% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/integrateIt.R
\name{integrateIt}
\alias{integrateIt}
\title{Create objects of class Trapezoid or Simspon}
\usage{
integrateIt(vector_x, vector_y, a, b, rule, ...)
}
\arguments{
\item{vector_x}{A vector of x values}

\item{vector_y}{A vector of f(x) values}

\item{a}{starting point for integration}

\item{b}{ending point for integration}

\item{rule}{either "Simp" or "Trap" to choose which object to make}
}
\value{
object An object of class Simpson or Trapezoid containing
 \item{vector_x}{a vector of x values}
 \item{vector_y}{a vector of f(x) values}
 \item{a}{starting value of integration}
 \item{b}{ending value of integration}
 \item{adjusted_x}{vector_x within a and b}
 \item{adjusted_y}{vector_y within a and b}
 \item{h}{h value used for calculation}
 \item{n}{number of values between a and b}
 \item{integrated_value}{the integrated value using Simpsons rule}
 \item{scalar}{vector of scalars used in calculation}
}
\description{
Creates either objects of class Trapezoid or Simpson with user inputsof vector_x, vector_y, a, and b.
}
\examples{
s = integrateIt(vector_x = 1:11,
                 vector_y = 1:11,
                 a = 3, b = 7, rule = "Simp")
t = integrateIt(vector_x = 1:11,
                 vector_y = 1:11,
                 a = 3, b = 7, rule = "Trap")
}
\author{
David Flaserstein
}
\seealso{
\code{\link{Trapezoid}}\code{\link{Simpson}}
}

