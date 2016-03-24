#' Create objects of class Trapezoid or Simspon
#'
#' Creates either objects of class Trapezoid or Simpson with user inputsof vector_x, vector_y, a, and b.
#' 
#' @param vector_x A vector of x values
#' @param vector_y A vector of f(x) values
#' @param a starting point for integration
#' @param b ending point for integration
#' @param rule either "Simp" or "Trap" to choose which object to make
#'
#' @return object An object of class Simpson or Trapezoid containing
#'  \item{vector_x}{a vector of x values}
#'  \item{vector_y}{a vector of f(x) values}
#'  \item{a}{starting value of integration}
#'  \item{b}{ending value of integration}
#'  \item{adjusted_x}{vector_x within a and b}
#'  \item{adjusted_y}{vector_y within a and b}
#'  \item{h}{h value used for calculation}
#'  \item{n}{number of values between a and b}
#'  \item{integrated_value}{the integrated value using Simpsons rule}
#'  \item{scalar}{vector of scalars used in calculation}
#' @author David Flaserstein
#' @seealso \code{\link{Trapezoid}}\code{\link{Simpson}}
#' @examples
#' s = integrateIt(vector_x = 1:11,
#'                  vector_y = 1:11,
#'                  a = 3, b = 7, rule = "Simp")
#' t = integrateIt(vector_x = 1:11,
#'                  vector_y = 1:11,
#'                  a = 3, b = 7, rule = "Trap")
#' @rdname integrateIt
#' @export
setGeneric(name="integrateIt",
           def=function(vector_x, vector_y, a, b, rule, ...)
           {standardGeneric("integrateIt")}
)
#' @export
setMethod(f="integrateIt",
          definition= function(vector_x, vector_y, a, b, rule){
            # Error checking is place here to catch errors before calculations are done later and to
            # provide more informative error messages
            # Error is printed out and the function is stopped
              if (!(rule == "Trap" | rule == "Simp")){
                 print("rule needs to equal Trap or Simp")
                 stop()
              }
              if(b <= a){
                print("b needs to be greater than a")
                stop()
              }
              if(length(vector_x) != length(vector_y)){
                print("vector_x needs to be the same length as vector_y")
                stop()
              }
              if(rule == "Trap"){
                  object =  new("Trapezoid", vector_x = vector_x, 
                                  vector_y = vector_y,
                                    a = a, b = b)
              }
              if(rule == "Simp"){
                n = length(which(vector_x >= a & vector_x <= b))-1
                   if(n %% 2 == 1){
                    print("There needs to be an even number of spaces 
                             etween a and b to successfully calculate Simpsons")
                    stop()
                  }
                  object = new("Simpson", vector_x = vector_x, 
                      vector_y = vector_y,
                      a = a, b = b)
                }
                  return(object)
                })
