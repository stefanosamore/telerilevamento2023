#classification of remote sensing data via RsStoolbox

Grand Canyon exercise

library(raster)
#install.packages("devtools")
#library (RStoolBox)
#installing devtools
#install.packages("devtools")
#install_github("bleutner/RStoolbox")

#per Mac
setwd("/Users/stefanosamore/desktop/lab")
brick("dolansprings_oli_2013088_canyon_lrg.jpg")
 
brick("dolansprings_oli_2013088_canyon_lrg.jpeg")

gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpg")
gc <- brick("dolansprings_oli_2013088_canyon_lrg.jpeg")
gc

# 3 layer del visibile 
# Red = 1
# Green = 2
# Blu = 3
## Plot RGB dell'immagine (stretch lineare)
plotRGB(gc, r=1, g=2, b=3, stretch="lin") 
plotRGB(gc, r=1, g=2, b=3, stretch="hist")

#Croppiamo l'iimagine che risulta essere troppo grande
crop(gc, drawExtent())
gcc<-crop(gc, drawExtent())
gcc<-crop(gc, drawExtent())

# per ottenere tutti i valori singoli
getValues(gc)
#restituisce tutti i valori o i valori per un certo numero di righe di un oggetto Raster
singlenr <- getValues(gc)
singlenr

#Classificazione
#center-> numero di calssi
kmeans(singlenr, centers = 3)
kcluster <- kmeans(singlenr, centers = 3)
kcluster

#Impostazione dei valori sulla base dell'immagine 
#per assegnare nuovi valori al raster
soclass<- setValues(so[[1]], kcluster$cluster) 

#Per cambiare colori alle classi
cl <- colorRampPalette(c('yellow','black','red'))(100)
plot(soclass, col=cl)
#si vede come i colori diversi rappresentino i diversi elementi 

# Calcolo della frequenza dei pixel nei cluster
frequencies <- freq(gcclass)
frequencies
tot <- ncell(sun_class)
tot 
percentages = frequencies * 100 /  tot



# Exercise: classify the map with 4 classes
singlenr_2 <- getValues(gc_crop)
singlenr_2

kcluster_2 <- kmeans(singlenr_2, centers = 4)
kcluster_2

gcclass_2 <- setValues(gc_crop[[1]], kcluster_2$cluster)

cl <- colorRampPalette(c('yellow','black','red', 'blue'))(100)
plot(gcclass_2, col=cl)

frequencies <- freq(gcclass_2)
frequencies
tot <- ncell(gcclass_2)
percentages = frequencies * 100 /  tot
percentages
