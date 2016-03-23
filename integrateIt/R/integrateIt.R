#' @export
integrateIt <- function(vector_x, vector_y, a, b, rule){
  if (!(rule == "Trap" | rule == "Simp")){
    return("rule needs to equal Trap or Simp")
  }
  if(rule == "Trap"){
    object =  new("Trapezoid", vector_x = vector_x, 
                     vector_y = vector_y,
                     a = a, b = b)
  }
  if(rule == "Simp"){
    object = new("Simpson", vector_x = vector_x, 
        vector_y = vector_y,
        a = a, b = b)
  }
  return(object)
} 