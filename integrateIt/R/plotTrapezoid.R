#' Plot objects of class Trapezoid
#'
#' Inputing an object of class Trapezoid plots an graph of the integral that was taken
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
              segments(x0=x@adjusted_x,y0=0, x1=x@adjusted_x,y1=x@adjusted_y,lty=2)
              # plots a and b points
              points(x=x@adjusted_x[1],y=x@adjusted_y[1] + 1, pch="a")
              points(x=x@adjusted_x[length(x@adjusted_x)],
                     y=x@adjusted_y[length(x@adjusted_x)] + 1, pch="b")
})
