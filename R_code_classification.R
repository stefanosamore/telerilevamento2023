#classification of remote sensing data via RsStoolbox

#installing devtools
#install.packages("devtools")

install_github("bleutner/RStoolbox")

Grand Canyon exercise


library(raster)

setwd("/Users/stefanosamore/desktop/lab")
brick("dolansprings_oli_2013088_canyon_lrg.jpg")
 
brick("dolansprings_oli_2013088_canyon_lrg.jpeg")

gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpeg")

gc

plotRGB(gc, r=1, g=2, b=3, stretch="lin") 
 plotRGB(gc, r=1, g=2, b=3, stretch="hist")

plotRGB(gc, r=1, g=2, b=3, stretch="lin")

crop(gc, drawExtent())

gcc<-crop(gc, drawExtent())

gcc<-crop(gc, drawExtent())

plotRGB(gcc, r=1, g=2, b=3, stretch="lin")
ncll(gcc)

ncell(gcc)
ncell(gc)


getValues(gc)
singlenr <- getValues(gc)
singlenr



kmeans(singlenr, centers = 3)
kcluster <- kmeans(singlenr, centers = 3)
kcluster

