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
               b = 11, rule = "Trap")
Trap =integrateIt(vector_x = 1:7,
               vector_y = c(1,7,3,8,9,4,6),
               a = 1,
               b = 7, rule = "Trap")
Simp =integrateIt(vector_x = 1:7,
               vector_y = c(1,7,3,8,9,4,6),
               a = 1,
               b = 7, rule = "Simp")
# examples of print
print(s)
print(Simp)
print(t)
print(Trap)
# examples of plot
plot(s)
plot(Simp)
plot(t)
plot(Trap)
