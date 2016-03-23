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
           n = c()
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
            .Object@integrated_value = h / 2 * sum((scalar * adjusted_y))
            return(.Object)
          }
) 