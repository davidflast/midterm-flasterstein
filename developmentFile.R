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
build_win(current.code)
# examples of integrate it
s =integrateIt(vector_x = 1:11,
            vector_y = 1:11,
            a = 5,
            b = 11, rule = "Simp")
t =integrateIt(vector_x = 1:11,
               vector_y = 1:11,
               a = 5,
               b = 11, rule = "Simp")
# examples of print
print(s)
print(t)
# examples of plot
plot(s)
plot(t)
