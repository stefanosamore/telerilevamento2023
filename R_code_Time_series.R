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


dift<- TGr[[2]] - TGr[[1]]
dift= TGr[[2]] - TGr[[1]]


dev.off()

levelplot(TGr)
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(TGr, col=cl)


#----Exercise 2: European NO2

library(raster)
setwd("/Users/stefanosamore/desktop/lab/en")

#importing a file
raster("EN_0001.png")
enfirst <- raster("EN_0001.png")


cl <- colorRampPalette(c('red','orange','yellow'))(100)
plot(enfirst, col=cl)


en13 <- raster("EN_0013.png")
plot(en13, col=cl)

# Let's import the whole set (altogether!)

# Exercise: import the whole as in the Greenland example
# by the following steps: list.files, lapply, stack

rlist <- list.files(pattern="EN")

# lapply(X,FUN)
rimp <- lapply(rlist, raster)

# stack
en <- stack(rimp)

# plot everything
plot(en, col=cl)


#check 1
par(mfrow=c(1,2))
plot(en[[1]], col=cl)
plot(enfirst, col=cl)

#check2 
difcheck<- enfirst - en [[1]]
difcheck

#first and last data

plot(en[[1]], col=cl)
plot(en[[13]], col=cl)

difen= en[[1]] - en[[13]]
difen
plot(difen, col=cl)
ldif <- colorRampPalette(c('blue','white','red'))(100)
plot(difen, col=cldif)

plotRGB(en, r=1, g=7, b=13, stretch="lin")
plotRGB(en, r=1, g=7, b=13, stretch="hist")






