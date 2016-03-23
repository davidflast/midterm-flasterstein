#' @export
setMethod(f = "print",
          signature = "integrated",
          definition = function (x, ...) {
            print(x@integrated_value)
          }
)