#R code for importing and analysing several images
library(raster)
# Impostazione della directory di lavoro
setwd("/Users/stefanosamore/desktop/lab")

# Importazione dell'immagine LST del 2000
lst_2000<- raster ("lst_2000.tif") 
plot(lst_2000 # Visualizza l'immagine del 2000

# Impostazione della directory per i dati della Groenlandia
# setwd("/Users/name/Desktop/lab/greenland") # Mac
setwd("/Users/stefanosamore/Desktop/lab/greenland_data")

# Importazione delle immagini per diverse date (2000, 2005, 2010, 2015)
#exercise import all the dates
lst_2000 <- raster("lst_2000.tif")
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

# Visualizzazione delle immagini in un layout di 2x2
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# Elenco dei file con "lst" nel nome (immagini termiche)
rlist <- list.files(pattern="lst") #tutto cararchter 
rlist # Visualizza la lista dei file

# Importa tutti i file nella lista con lapply e raster
import <- lapply(rlist,raster) 
import 

# Crea uno stack di immagini sovrapposte
TGr <- stack(import)
TGr # Visualizza lo stack di immagini
plot(TGr) # Plotta 

# Visualizzazioni RGB cambiando le bande
plotRGB(TGr, 1, 2, 3, stretch="Lin")
plotRGB(TGr, 2, 3, 4, stretch="Lin")
plotRGB(TGr, 4, 3, 2, stretch="Lin")

# Differenza tra le prime due immagini 
dift<- TGr[[2]] - TGr[[1]]
dift= TGr[[2]] - TGr[[1]]
dift 

dev.off()

levelplot(TGr)
# Imposta una palette di colori 
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(TGr, col=cl)


#  Exercise 2: European NO2

library(raster)
setwd("/Users/stefanosamore/desktop/lab/en") # Directory per dati NO2

# Importa la prima immagine di NO2
raster("EN_0001.png")
enfirst <- raster("EN_0001.png")

# Visualizza la prima immagine di NO2 con una palette di colori
cl <- colorRampPalette(c('red','orange','yellow'))(100)
plot(enfirst, col=cl)

# Importa un'altra immagine (EN_0013)
en13 <- raster("EN_0013.png")
plot(en13, col=cl)

# Importa tutto il set di immagini (come fatto per la Groenlandia)
# Usa list.files, lapply, stack per importare tutte le immagini
rlist <- list.files(pattern="EN") # Lista di file con "EN" nel nome

# Importa tutti i file della lista
rimp <- lapply(rlist, raster)
# stack
en <- stack(rimp)
     
# Plotta tutte le immagini dello stack con la palette di colori
plot(en, col=cl)

#check 1
par(mfrow=c(1,2))
plot(en[[1]], col=cl)
plot(enfirst, col=cl)
#check2 
difcheck<- enfirst - en [[1]]
difcheck

# Confronto tra la prima e l'ultima immagine dello stack
plot(en[[1]], col=cl) # Prima immagine
plot(en[[13]], col=cl) # Ultima immagine

# Differenza tra la prima e l'ultima immagine
difen= en[[1]] - en[[13]]
difen
plot(difen, col=cl)
     
# Imposta una palette di colori diversa per visualizzare la differenza
ldif <- colorRampPalette(c('blue','white','red'))(100)
plot(difen, col=cldif)

# Visualizziamo con RGB usando diverse bande
plotRGB(en, r=1, g=7, b=13, stretch="lin")
plotRGB(en, r=1, g=7, b=13, stretch="hist") # RGB con stretch istogramma






