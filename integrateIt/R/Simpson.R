#' A Simpson object
#' 
#' Object of class \code{Simpson} are created by the \code{integrateIt} function.
#' This object takes in a vector of x and y and estimates the integral between a 
#' and b using Simpson's rule.
#'
#' 
#' An object of the class `Simpson' has the following slots:
#' \itemize{
#' \item \code{vector_x} a vector of x values
#' \item \code{vector_y} a vector of f(x) values
#' \item \code{a} starting value of integration
#' \item \code{b} ending value of integration
#' \item \code{adjusted_x} vector_x within a and b
#' \item \code{adjusted_y} vector_y within a and b
#' \item \code{h} h value used for calculation
#' \item \code{n} number of values between a and b
#' \item \code{integrated_value} the integrated value using Simpsons rule
#' \item \code{scalar} vector of scalars used in calculation
#' }
#'
#' @author David P. Flasterstein: \email{davidflasterstein@@wustl.edu}
#' @aliases Simpson-class initialize,Simpson-method print, Simpson-method plot
#' @rdname Simpson
#' @examples
#'  S = new("Simpson", vector_x = 1:11,
#'           vector_y = 1:11, a = 3,b = 7)
#'  s = integrateIt(vector_x = 1:11,
#'                  vector_y = 1:11,
#'                  a = 3, b = 7, rule = "Simp")
#' @export
setClass(Class="Simpson",
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
setValidity("Simpson", function(object){
  if((object@n %% 2) == 0){
    return("There needs to be an even number of spaces 
           between a and b to successfully calculate Simpsons")
  }
}
)
#' @export
setMethod("initialize", "Simpson", 
          function(.Object, vector_x, vector_y, a, b, ...){
            .Object@vector_x = vector_x
            .Object@vector_y = vector_y
            .Object@a = a
            .Object@b = b
            adjusted_x = which(vector_x >= a & vector_x <= b)
            .Object@adjusted_x = adjusted_x
            adjusted_y = vector_y[which(vector_x >= a & vector_x <= b)]
            .Object@adjusted_y = adjusted_y
            n = length(which(vector_x >= a & vector_x <= b)) - 1
            .Object@n = n
            h = (b - a) / n
            .Object@h = h
            scalar = c(1,rep(c(4,2), (n - 2)/2), 4, 1)
            .Object@scalar = scalar
            .Object@integrated_value = h / 3 * sum((scalar * adjusted_y))
            return(.Object)
          }
) 