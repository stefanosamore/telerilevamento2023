# My firts code in Git Hub
# Let's install the raster package

intall.packages("raster")
library("raster")

# import data, setting the working directory
setwd("/User/stefano/desktop/lab")
l2011 <- brick("p224r63_2011_masked.grd")

#plotting the data in a savage manner
plot(l2011)

cl <- colorRampPalette(c("red", "orange", "yellow"))(100)
plot(12011, col=cl)

#Exercise: plot the NIR band
#b1=blue
#b2=green
#b3=red
#b4= NIR

plot(l2011[[4]], col=cl)
Plot(l2011$B4_sre, col=cl)

#dev.off #it closes graphs
# Export graphs in R
pdf("myfirtgraph.pdf")

plot(l2011$B4_sre, col=cl)
dev.off()

#plotting several bands ina a multiframe
par(mfrow=c(2,1))
plot(l2011[[3]], col=cl)
plot(l2011[[4]], col=cl)

#plotting the first 4 layers/bands
par(mfrow=c(2,2))

#blue
clb <- colorRampPalette(c("blue4","blue2", "light blue"))(100)
plot(l2011[[1]], col=cl)

clb <- colorRampPalette(c("chartreuse4","chartreuse2", "chartreuse"))(100)
plot(l2011[[2]], col=cl)

clb <- colorRampPalette(c("brown2","brown3", "coral2"))(100)
plot(l2011[[3]], col=cl)

clb <- colorRampPalette(c("brown2","brown3", "coral2"))(100)
plot(l2011[[4]], col=cl)

#Exercise: plot the NIR band 
plot(l2011[[4]]
plotRGB(l2011, r=3, g=2, b=1, stretch="Lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin") 
plotRGB(l2011, r=3, g=4, b=2, stretch="Lin")
plotRGB(l2011, r=3, g=2, b=4, stretch="Lin")  
     
#Exercise: import the 1988 image
l1988 <-brick("p224r63_1988_masked.grd")
l1988
plot(l1988)
plot(l1988[[4]])
     
#Exercise: plot i RGB space (natural colours)
plotRGB(l1988, r=3, g=2, b=1, stretch="Lin")
plotRGB(l1988, r=4, g=3, b=2, stretch="Lin")

     
#multiframe
par(mfrow=c(2, 1))
plotRGB(l1988, 4, 3, 2, stretch="Lin")
plotRGB(l2011, r=4, g=3, b=2, stretch="Lin")


plotRGB(l1988, 4, 3, 2, stretch="Hist")
    
#multiframe with 4 images
par(mfrow=c(2, 2))
plotRGB(l1988, 4, 3, 2, stretch="Lin")
plotRGB(l2011, 4, 3, 2, stretch="Lin")
plotRGB(l1988, 4, 3, 2, stretch="Hist")
plotRGB(l2011, 4, 3, 2, stretch="Hist")


  
     
     
     
     
     
     
     
     





