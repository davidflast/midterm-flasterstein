#' A Trapezoid object
#' 
#' Object of class \code{Trapezoid} are created by the \code{integrateIt} function.
#' This object takes in a vector of x and y and estimates the integral between a 
#' and b using the Trapezoidal rule.
#'
#' 
#' An object of the class `Trapezoid' has the following slots:
#' \itemize{
#' \item \code{vector_x} a vector of x values
#' \item \code{vector_y} a vector of f(x) values
#' \item \code{a} starting value of integration
#' \item \code{b} ending value of integration
#' \item \code{adjusted_x} vector_x within a and b
#' \item \code{adjusted_y} vector_y within a and b
#' \item \code{h} h value used for calculation
#' \item \code{n} number of values between a and b
#' \item \code{integrated_value} the integrated value using trapezoidal rule
#' \item \code{scalar} vector of scalars used in calculation
#' }
#'
#' @author David P. Flasterstein: \email{davidflasterstein@@wustl.edu}
#' @aliases Trapezoid-class initialize,Trapezoid-method print
#' @rdname Trapezoid
#' @examples
#'  T = new("Trapezoid", vector_x = 1:11,
#'           vector_y = 1:11, a = 3,b = 7)
#'  t = integrateIt(vector_x = 1:11,
#'                  vector_y = 1:11,
#'                  a = 3, b = 7, rule = "Trap")
#' @export
setClass(Class="Trapezoid",
         contains="integrated",
         prototype=prototype(
           vector_x = c(),
           vector_y = c(),
           a = c(),
           b = c(),
           adjusted_x = c(),
           adjusted_y = c(),
           integrated_value = c(),
           h = c(),
           n = c(),
           scalar = c()
         )
)
#' @export
setMethod("initialize", "Trapezoid", 
          function(.Object, vector_x, vector_y, a, b, ...){
            .Object@vector_x = vector_x
            .Object@vector_y = vector_y
            .Object@a = a
            .Object@b = b
            adjusted_x = which(vector_x >= a & vector_x <= b)
            .Object@adjusted_x = adjusted_x
            adjusted_y = vector_y[which(vector_x >= a & vector_x <= b)]
            .Object@adjusted_y = adjusted_y
            n = length(which(vector_x >= a & vector_x <= b))
            .Object@n = n
            h = (b - a) / n
            .Object@h = h
            scalar = c(1,rep(2, n - 2), 1)
            .Object@scalar = scalar
            .Object@integrated_value = h / 2 * sum((scalar * adjusted_y))
            return(.Object)
          }
) 