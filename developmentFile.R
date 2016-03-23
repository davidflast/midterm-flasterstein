# Load in necessary libraries and set working directory
library(devtools)
library(roxygen2)
setwd("/Users/davidflast/Documents/midterm-flasterstein")

# Creates a skeleton of a package to put files into
package.skeleton(name="integrateIt")

# Continously update to create man files
current.code <- as.package("integrateIt")
load_all(current.code)
document(current.code)

new("Trapezoid", vector_x = 1,
    vector_y = 1,
    a = 1,
    b = 1,
    adjusted_x = 1,
    adjusted_y = 1,
    integrated_value = 1,
    h = 1)
