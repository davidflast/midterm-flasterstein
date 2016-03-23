#' Print Trapezoid or Simpson objects
#'
#' Inputting an object of class Trapezoid or Simpson prints out the integrated_value of those objects
#'
#' @param x object of class Trapezoid, Simpson, or integreated
#'
#' @return The integrated_value of the Object
#' @author David Flaserstein
#' @examples 
#' 
#' s = integrateIt(vector_x = 1:11,
#' vector_y = 1:11,
#' a = 3, b = 7, rule = "Simp")
#' print(s)
#' t = integrateIt(vector_x = 1:11,
#'               vector_y = 1:11,
#'               a = 3, b = 7, rule = "Trap")
#' print(t)
#' @rdname printIntegrated
#' @aliases Trapezoid-method printTrapezoid,Simpson-method printSimpson
#' @export
setMethod(f = "print",
          signature = "integrated",
          definition = function (x, ...) {
            print(x@integrated_value)
          }
)