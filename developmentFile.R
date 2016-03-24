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
?Trapezoid
?printSimpson
?Simpson
?integrateIt
?printIntegrated
z = integrateIt(vector_x = 1:11,
            vector_y = 1:11,
            a = 5,
            b = 10, rule = "trap")
print(z)
?plotTrapezoid
?plot
v = new("Simpson", vector_x = 1:5,
    vector_y =c(5,6,10,2,7) ,
    a = 1,
    b = 5
)
plot(v)
print(v)
v =new("Simpson", vector_x = 1:11,
    vector_y = 1:11,
    a = 3,
    b = 7
)