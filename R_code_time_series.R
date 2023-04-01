#R code for importing and analysing several images
library(raster)
setwd("/Users/stefanosamore/desktop/lab")

lst_2000<- raster ("lst_2000.tif") 
plot(lst_2000)

# setwd("/Users/name/Desktop/lab/greenland") # Mac
setwd("/Users/stefanosamore/Desktop/lab/greenland_data")

#exercise import all the dates
lst_2000 <- raster("lst_2000.tif")
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

# par
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# list f files:
rlist <- list.files(pattern="lst") #tutto cararchter 
rlist

import <- lapply(rlist,raster) 
import

TGr <- stack(import)
TGr
plot(TGr)


plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 2, 3, 4, stretch="Lin")
plotRGB(TGr, 4, 3, 2, stretch="Lin")





