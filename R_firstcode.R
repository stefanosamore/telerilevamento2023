# My firts code in Git Hub
# Let's install the raster package

intall.packages("raster")
library("raster")

# import data, setting the working directory
setwd("/User/stefano/desktop/lab")
l2011 <- brick("p224r63_2011_masked.grd")
plot(l2011)
