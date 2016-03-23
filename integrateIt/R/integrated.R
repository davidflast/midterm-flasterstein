# Creates a class integrated which forms the main class for 
# the subclasses simpson and trapezoid.
# Has the slots
#' @export
setClass(Class="integrated",
         representation = representation(
           vector_x = "numeric",
           vector_y = "numeric",
           a = "numeric",
           b = "numeric",
           adjusted_x = "numeric",
           adjusted_y = "numeric",
           integrated_value = "numeric",
           h = "numeric",
           n = "numeric",
           scalar = "numeric"
         ),
         prototype = prototype(
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