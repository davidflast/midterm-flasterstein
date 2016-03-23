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
