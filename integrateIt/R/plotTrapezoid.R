#' Plot objects of class Trapezoid
#'
#' Inputing an object of class Trapezoid plots an graph of the inregral that was taken
#'
#' @param x object of class Trapezoid
#'
#' @return A graph of the Trapezodial estimation of the integral that was taken
#' @author David Flaserstein
#' @examples 
#' 
#'  t = integrateIt(vector_x = 1:11,
#'                  vector_y = 1:11,
#'                  a = 3, b = 7, rule = "Trap")
#'  plot(t)
#' @rdname plotTrapezoid
#' @export
setMethod(f = "plot",
          signature = "Trapezoid",
          definition = function (x, ...) {
            # sets up graph and plots the points
            plot(x = x@adjusted_x, y = x@adjusted_y, 
                   xlim=c(x@a,x@b),ylim=c(0, max(x@adjusted_y)+3), pch=19,
                   xlab="x", ylab="f(x)",main="Trapezoidal Rule", col="red")
            # plots the upper part of the trapezoid
            lines(x@adjusted_x, x@adjusted_y,col = "red")
              # graphs vertical lines
              for(i in 1:(x@n)){
                x_point = x@adjusted_x[i]
                y_point = x@adjusted_y[i]
                x_vec = c(x_point,x_point)
                y_vec = c(0,y_point)
                lines(x=x_vec, y=y_vec, lty=2)
              }
            }
)
