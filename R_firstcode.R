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


