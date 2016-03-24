#' Plot objects of class Simpson
#'
#' Inputing an object of class Simpson plots a graph of the integral that was taken
#'
#' @param x object of class Simpston
#'
#' @return A graph of Simpson's estimation of the integral that was taken between a and b
#' @author David Flaserstein
#' @examples 
#' 
#'  s = integrateIt(vector_x = 1:11,
#'                  vector_y = 1:11,
#'                  a = 3, b = 7, rule = "Simp")
#'  plot(s)
#' @rdname plotSimpson
#' @export
setMethod(f = "plot",
          signature = "Simpson",
          definition = function (x, ...) {
            # sets up graph and plots the points
            plot(x = x@adjusted_x, y = x@adjusted_y, 
                 xlim=c(x@a,x@b),ylim=c(0, max(x@adjusted_y)+3), type = "n",
                 xlab="x", ylab="f(x)",main="Simpson's Rule")
            # plot vertical dotted lines to show how segments are seperated
            segments(x0=x@adjusted_x, y0=0, x1=x@adjusted_x,y1=x@adjusted_y,lty=2)
            # graph a and b solid lines
            segments(x0=x@adjusted_x[1], y0=0, x1=x@adjusted_x[1],y1=x@adjusted_y[1],lty=1)
            segments(x0=x@adjusted_x[length(x@adjusted_x)], 
                     y0=0, x1=x@adjusted_x[length(x@adjusted_x)],
                     y1=x@adjusted_y[length(x@adjusted_x)],lty=1)
            # plots a and b points
            points(x=x@adjusted_x[1],y=x@adjusted_y[1] + 1, pch="a")
            points(x=x@adjusted_x[length(x@adjusted_x)],
                   y=x@adjusted_y[length(x@adjusted_x)] + 1, pch="b")
            # draws the curves
            sapply(seq(1,x@n -1,2), function(i) {
              u  <- x@adjusted_x[i]
              w  <- x@adjusted_x[i + 2]
              v  <- x@adjusted_x[i + 1]
              fu <- x@adjusted_y[i]
              fv <- x@adjusted_y[i + 1]
              fw <- x@adjusted_y[i + 2]
              curve(expr=fu * ((x-v)*(x-w))/((u-v)*(u-w)) + 
                  fv * ((x-u)*(x-w))/((v-u)*(v-w)) +
                  fw * ((x-u)*(x-v))/((w-u)*(w-v)), 
                  from=u, to=w, add = TRUE,col="red")
              
              })
          })