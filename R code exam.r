# Installiamo i pacchetti necessari per le analisi 
#install.packages("terra") #gestione e analisi di dati raster
#install.packages("viridis") # palette colori
#install.packages("ggplot2") # creazione di grafici
#install.packages("sf") # lavorare con shapefile e dati spaziali
#install.packages("raster") # manipolazione di raster
#install.packages("RStoolbox") # strumenti per l'analisi di immagini satellitari
#install.packages("devtools")

# carichiamo i pacchetti necessari
library(terra)
library(viridis)
library(ggplot2)
library(sf)
library(raster)
library(RStoolbox)
library(devtools)

#setting della wd in cui si trovano i nostri dati
setwd("/Users/stefanosamore/desktop/lab/Forni_Glacier_Analysis")

# Importiamo le immagini satellitari di marzo 2023
# creo una lista dei file con un pattern specifico
rlist0323 <- list.files(pattern="LC08_L2SP_193028_20230315_20230321_02_T1_SR_B")
rlist0323
# importiamo le immagini raster in una lista
import0323 <- lapply(rlist0323, raster)
import0323
# creiamo uno stack (combinazione dei vari layer) di immagini raster (multibanda)
forni0323 <- stack(import0323)
forni0323

# Plot
# Visualizziamo il raster in diverse bande
plot(forni0323)
plotRGB(forni0323, r=4, g=3, b=2, stretch="hist") # Composizione RGB con stretching istogramma

# Importiamo lo shapefile con l'area contenente i ghiacciai prodotto in QGIS
areaghiacc <- st_read("ghiacciaio.shp")
areaghiacc

# Ritagliamo il raster usando l'area del ghiacciaio (shapefile) sull'immagine scaricata da Landsat
fornicut0323 <- crop(forni0323, areaghiacc)
fornicut0323
# Visualizziamo il raster ritagliato
plot(fornicut0323)
plotRGB(fornicut0323, r=4, g=3, b=2, stretch="lin") # stretching lineare
plotRGB(fornicut0323, r=5, g=4, b=3, stretch="lin") # Visualizzazione in Near-Infrared (NIR)

# Con la funzione mask abbiamo ritagliato il raster secondo la forma precisa dello shapefile
forni0323d <- mask(fornicut0323, areaghiacc)
plot(forni0323d)

# Visualizziamo in colori naturali e il NIR nel rosso
plotRGB(forni0323d, r=4, g=3, b=2, stretch="lin")
plotRGB(forni0323d, r=5, g=4, b=3, stretch="lin")

# Ripetiamo il processo per altre immagini
# Immagine settembre 2023
rlist0923 <- list.files(pattern="LC08_L2SP_193028_20230907_20230912_02_T1_SR_B")
rlist0923
import0923 <- lapply(rlist0923, raster)
import0923
forni0923 <- stack(import0923)
forni0923

# Visualizzazione e ritaglio dell'immagine di settembre 2023
plot(forni0923)
plotRGB(forni0923, r=4, g=3, b=2, stretch="hist")
fornicut0923 <- crop(forni0923, areaghiacc)
fornicut0923
plot(fornicut0923)
plotRGB(fornicut0923, r=4, g=3, b=2, stretch="lin")
plotRGB(fornicut0923, r=5, g=4, b=3, stretch="lin")

# Utilizziamo la funzione mask per il ritagliato del raster sulla forma dello shapefile
forni0923d <- mask(fornicut0923, areaghiacc)
plot(forni0923d)
plotRGB(forni0923d, r=4, g=3, b=2, stretch="lin")
plotRGB(forni0923d, r=5, g=4, b=3, stretch="lin")

# Immagine marzo 2009, scaricata da Landsat 7
rlist0309 <- list.files(pattern="LE07_L2SP_193028_20090316_20200912_02_T1_SR_B")
rlist0309
import0309 <- lapply(rlist0309, raster)
import0309
forni0309 <- stack(import0309)
forni0309

# Per Landsat 7 -> b=1, g=2, r=3, NIR=4
plot(forni0309)
plotRGB(forni0309, r=3, g=2, b=1, stretch="lin") #si vede meglio con hist

fornicut0309 <- crop(forni0309, areaghiacc)
fornicut0309
plot(fornicut0309)
plotRGB(fornicut0309, r=3, g=2, b=1, stretch="hist")
plotRGB(fornicut0309, r=4, g=3, b=2, stretch="hist")

forni0309d <- mask(fornicut0309, areaghiacc)
plot(forni0309d)
plotRGB(forni0309d, r=3, g=2, b=1, stretch="lin")
plotRGB(forni0309d, r=4, g=3, b=2, stretch="lin")

# Landsat 7 presenta alcune limitazioni (stripes, colori di difficile interpretazione e difficili da confrontare)
# Optiamo quindi per immagini da Landsat 8, meglio confrontabili, a costo di fare un'analisi riferita a un periodo temporale minore

# Immagine marzo 2017
rlist0317 <- list.files(pattern="LC08_L2SP_193028_20170330_20200904_02_T1_SR_B")
rlist0317
import0317 <- lapply(rlist0317, raster)
import0317
forni0317 <- stack(import0317)
forni0317

#plot
plot(forni0317)
plotRGB(forni0317, r=4, g=3, b=2, stretch="lin")

fornicut0317 <- crop(forni0317, areaghiacc)
fornicut0317
plot(fornicut0317)
plotRGB(fornicut0317, r=4, g=3, b=2, stretch="lin")
plotRGB(fornicut0317, r=5, g=4, b=3, stretch="lin")

forni0317d <- mask(fornicut0317, areaghiacc)
plot(forni0317d)
plotRGB(forni0317d, r=4, g=3, b=2, stretch="lin")
plotRGB(forni0317d, r=5, g=4, b=3, stretch="lin")

#immagine settembre 2017
rlist0917 <- list.files(pattern="LC08_L2SP_193028_20170922_20200903_02_T1_SR_B")
rlist0917
import0917 <- lapply(rlist0917, raster)
import0917
forni0917 <- stack(import0917)
forni0917

#plot
plot(forni0917)
plotRGB(forni0917, r=4, g=3, b=2, stretch="hist")

fornicut0917 <- crop(forni0917, areaghiacc)
fornicut0917
plot(fornicut0917)
plotRGB(fornicut0917, r=4, g=3, b=2, stretch="lin")
plotRGB(fornicut0917, r=5, g=4, b=3, stretch="lin")

forni0917d <- mask(fornicut0917, areaghiacc)
plot(forni0917d)
plotRGB(forni0917d, r=4, g=3, b=2, stretch="lin")
plotRGB(forni0917d, r=5, g=4, b=3, stretch="lin")

# Plot per la visualizzazione in colori naturali delle quattro immagini scaricate
par(mfrow=c(2, 2))
plotRGB(forni0317d, r=4, g=3, b=2, stretch="lin")
plotRGB(forni0323d, r=4, g=3, b=2, stretch="lin")
plotRGB(forni0917d, r=4, g=3, b=2, stretch="lin")
plotRGB(forni0923d, r=4, g=3, b=2, stretch="lin")

# Plot per la visualizzazione del NIR nel rosso delle quattro immagini scaricate
par(mfrow=c(2, 2))
plotRGB(forni0317d, r=5, g=4, b=3, stretch="lin")
plotRGB(forni0323d, r=5, g=4, b=3, stretch="lin")
plotRGB(forni0917d, r=5, g=4, b=3, stretch="lin")
plotRGB(forni0923d, r=5, g=4, b=3, stretch="lin")

# Calcolo degli indici spettrali (DVI, NDVI, NDSI) per analizzare la presenza di copertura data da ghiacciaio o neve
# DVI = Differenza Vegetation Index, NDVI = Normalized Difference Vegetation Index
#DVI and NDVI
# immagine settembre 2023
dvi0923 <- forni0923d[[5]]-forni0923d[[4]]
dvi0923
ndvi0923 <- dvi0923/(forni0923d[[5]]+forni0923d[[4]])
ndvi0923

# Ripetiamo il calcolo per le immagini di altre date
# immagine marzo 2023
dvi0323 <- forni0323d[[5]]-forni0323d[[4]]
dvi0323
ndvi0323 <- dvi0323/(forni0323d[[5]]+forni0323d[[4]])
ndvi0323

# immagine settembre 2017
dvi0917 <- forni0917d[[5]]-forni0917d[[4]]
dvi0917
ndvi0917 <- dvi0917/(forni0917d[[5]]+forni0917d[[4]])
ndvi0917

# immagine marzo 2017
dvi0317 <- forni0317d[[5]]-forni0317d[[4]]
dvi0317
ndvi0317 <- dvi0317/(forni0317d[[5]]+forni0317d[[4]])
ndvi0317

# Visualizziamo gli indici NDVI
par(mfrow=c(2, 2)) # Impostiamo un layout di 2x2 
plot(ndvi0317, col=viridis(200, option="F")) # Visualizzazione con la palette F di viridis 'Rocket'
plot(ndvi0323, col=viridis(200, option="F")) 
plot(ndvi0917, col=viridis(200, option="F")) 
plot(ndvi0923, col=viridis(200, option="F"))
# Valori alti di NDVI (colorazione più chiara) inidcano aree coperte da vegetazione (che riflette fortemente nel vicino infrarosso e assorbe molto la componenete rossa
# Coperture a neve e ghiaccio danno valori di NDVI prossimi allo zero o negativi ( riflettono moderatamante sia nel rosso che nel NIR)
# La neve riflette più del ghiaccio, infatti risulta avere valori poco più alti di NDVI rispetto al ghiaccio (fonte:esa)

# Calcolo del NDSI (Normalized Difference Snow Index)
# Il NDSI viene utilizzato per rilevare la neve neve, che ha una riflettanza elevata nel verde e bassa nel SWIR.
# Formula: (green - SWIR 1) / (green + SWIR 1)
# Calcolo del NDSI per i dati di settembre 2023
ndsi0923 <- (forni0923d[[3]]-forni0923d[[6]])/(forni0923d[[3]]+forni0923d[[6]])
# Visualizzazione del risultato per settembre 2023
ndsi0923

# Calcolo del NDSI per i dati di marzo 2023 
ndsi0323 <- (forni0323d[[3]]-forni0323d[[6]])/(forni0323d[[3]]+forni0323d[[6]])
ndsi0323

# Calcolo del NDSI per i dati di settembre 2017 
ndsi0917 <- (forni0917d[[3]]-forni0917d[[6]])/(forni0917d[[3]]+forni0917d[[6]])
ndsi0917

# Calcolo del NDSI per i dati di marzo 2017 
ndsi0317 <- (forni0317d[[3]]-forni0317d[[6]])/(forni0317d[[3]]+forni0317d[[6]])
ndsi0317

# Plot del NDSI
par(mfrow=c(2, 2)) # per visualizzare 4 immagini in una griglia 2x2
plot(ndsi0317, col=viridis(200, option="G")) # Utilizza la funzione viridis con la palette "G" (Mako)
plot(ndsi0323, col=viridis(200, option="G")) 
plot(ndsi0917, col=viridis(200, option="G")) 
plot(ndsi0923, col=viridis(200, option="G")) 
# Valori alti di NDSI indicano neve o ghiaccio (non distinguendoli), in quanto la neve riflette molto nel verde ma poco nel medio infrarosso (SWIR)
# La vegetazione presenta valori vicino allo 0 in quanto riflette più nello SWIR che nel verde

# ALTRI INDICI
# Sperimentazione di altri indici, esclusi dalla presentazione
# le immagini risultanti risultanti non fornivano risultati significativi per l'interpretazione dei dati
# Calcolo del NDGI (Normalized Difference Glacier Index)
# Questo indice utilizza le bande "green" e "red" per evidenziare i ghiacciai
# Formula: (Green - Red) / (Green + Red)
# ndgi0923 <- (forni0923d[[3]]-forni0923d[[4]])/(forni0923d[[3]]+forni0923d[[4]])
# ndgi0923
# ndgi0323 <- (forni0323d[[3]]-forni0323d[[4]])/(forni0323d[[3]]+forni0323d[[4]])
# ndgi0323
# ndgi0917 <- (forni0917d[[3]]-forni0917d[[4]])/(forni0917d[[3]]+forni0917d[[4]])
# ndgi0917
# ndgi0317 <- (forni0317d[[3]]-forni0317d[[4]])/(forni0317d[[3]]+forni0317d[[4]])
# ndgi0317
# Plot per la visualizzazione dell'indice NDGI delle quattro immagini scaricate 
# par(mfrow=c(2, 2)) # Layout di 2x2
# plot(ndgi0317, col=viridis(200, option="G")) # Utilizziamo la palette "G" di viridis - Mako
# plot(ndgi0323, col=viridis(200, option="G")) 
# plot(ndgi0917, col=viridis(200, option="G")) 
# plot(ndgi0923, col=viridis(200, option="G")) 

# NDSII
# Calcolo del NDSII (Normalized Difference Snow/Ice Index)
# Questo indice utilizza le bande "green" e "SWIR2" per distinguere neve e ghiaccio
# Formula: (Green - SWIR2) / (Green + SWIR2)
# ndsii0923 <- (forni0923d[[3]]-forni0923d[[5]])/(forni0923d[[3]]+forni0923d[[5]])
# ndsi0923
# ndsii0323 <- (forni0323d[[3]]-forni0323d[[5]])/(forni0323d[[3]]+forni0323d[[5]])
# ndsii0323
# ndsii0917 <- (forni0917d[[3]]-forni0917d[[5]])/(forni0917d[[3]]+forni0917d[[5]])
# ndsii0917
# ndsii0317 <- (forni0317d[[3]]-forni0317d[[5]])/(forni0317d[[3]]+forni0317d[[5]])
# ndsii0317
# par(mfrow=c(2, 2))
# plot(ndsii0317, col=viridis(200, option="G")) #mako
# plot(ndsii0323, col=viridis(200, option="G")) 
# plot(ndsii0917, col=viridis(200, option="G")) 
# plot(ndsii0923, col=viridis(200, option="G")) 

# CLASSIFiCAZIONE
# La funzione 'unsuperClass' esegue una classificazione delle immagini raster in base ai dati forniti
# Richiediamo di suddividerle in 3 classi (nClasses=3). Queste classi rappresentano diverse superfici come neve, neve sporca e vegetazione

# Classificazione per l'immagine di marzo 2017
class0317 <- unsuperClass(forni0317d, nClasses=3) 
# Mostra il risultato della classificazione
class0317
class0917 <- unsuperClass(forni0917d, nClasses=3) 
class0917
class0323 <- unsuperClass(forni0323d, nClasses=3) 
class0323
class0923 <- unsuperClass(forni0923d, nClasses=3) 
class0923

# Visualizzazione delle classificazioni in un layout a 4 grafici, con colori generati dalla palette E di viridis (cividis)
par(mfrow=c(2, 2))
plot(class0317$map, col=viridis(4, option="E")) #cividis
plot(class0323$map, col=viridis(4, option="E")) 
plot(class0917$map, col=viridis(4, option="E")) 
plot(class0923$map, col=viridis(4, option="E")) 

# Plottiamo le immagini ottenute dalla classificazione con le immagini a colori naturali cosi da riuscire ad interpretarle meglio
par(mfrow=c(2, 2))
plot(class0917$map, col=viridis(4, option="E")) 
plot(class0923$map, col=viridis(4, option="E"))
plotRGB(forni0917d, r=4, g=3, b=2, stretch="lin")
plotRGB(forni0923d, r=4, g=3, b=2, stretch="lin")

# Analisi delle frequenze delle classi ottenute per ciascuna immagine
# Marzo 2017
freq(class0317$map) # Funzione per contare i pixel appartenenti a ciascuna classe
# Classe 1= neve  -> 322094
# Classe 2= neve sporca -> 322538
# Classe 3= vegetazione -> 624531

# Settembre 2017
freq(class0917$map)
# Classe 1= neve sporca  -> 127160
# Classe 2= neve -> 86587
# Classe 3= vegetazione -> 1049876

# Marzo 2023
freq(class0323$map)
# Classe 1= vegetazione  -> 536864
# Classe 2= neve -> 427253
# Classe 3= neve sporca -> 304895

# Settembre 2023
freq(class0923$map)
# Classe 1= suolo nudo  -> 580055
# Classe 2= vegetazione -> 656436
# Classe 3= neve -> 31566

# Numero totale di pixel
# Il numero totale di pixel per ciascuna immagine è lo stesso: 2173908.
# Questo numero rappresenta la risoluzione spaziale delle immagini usate per la classificazione.
forni0317d # Informazioni sul raster di marzo 2017
tot0317 <- 2173908  # Numero totale di pixel per l'immagine di marzo 2017
forni0917d
tot0917 <- 2173908
forni0323d
tot0323 <- 2173908
forni0923d
tot0923 <- 2173908

# Percentuale di copertura neve-ghiaccio
# Calcolo della percentuale di neve e ghiaccio presente per ciascuna immagine
# sommando i pixel delle classi corrispondenti (neve e neve sporca) e dividendo per il totale dei pixel.
# Calcolo per marzo 2017
ice0317 <- (322094+322538)/tot0317*100 # somma delle classi 1 (neve) e 2 (neve sporca)
ice0317 
# 29.65314 - 
# il 29.65314% della superficie è coperta da neve o ghiaccio a marzo 2017
# Calcolo per settembre 2017
ice0917 <- (127160+86587)/tot0917*100 
ice0917
#9.832385
# Calcolo per marzo 2023
ice0323 <- (427253+304895)/tot0323*100 
ice0323
#33.67889
# Calcolo per settembre 2023
ice0923 <- (31566)/tot0923*100 
ice0923
#1.452039
# Questi calcoli evidenziano una forte variazione stagionale nella copertura di neve e ghiaccio
# Si nota un drastico calo nella copertura di neve a settembre 2023 rispetto a settembre 2017

# Percentuale di vegetazione
# Calcola della percentuale di vegetazione presente per ciascuna immagine
# utilizzando i pixel della classe corrispondente a vegetazione e dividendo per il totale dei pixel.
# Calcolo per marzo 2017
veg0317 <- (624531)/tot0317*100 # Percentuale di vegetazione a marzo 2017
veg0317
# 28.72849 - il 28.72849% della superficie è coperta da vegetazione a marzo 2017
# Calcolo per settembre 2017
veg0917 <- (1049876)/tot0917*100 
veg0917
#48.29441
# Calcolo per marzo 2023
veg0323 <- (536864)/tot0323*100 
veg0323
#24.6958
# Calcolo per settembre 2023
veg0923 <- (656436+580055)/tot0923*100 
veg0923
#56.87872

# DATAFRAME
# Creazione di un dataframe con le percentuali di neve e vegetazione per ciascuna data di rilevamento
# (gli anni verranno visualizzati nelle colonne)
# Definizione delle classi di copertura
classi <- c("Neve%", "Vegetazione%") # Prima colonna, nome delle classi di copertura
# Percentuali di neve e vegetazione per ciascun periodo
perc0317 <- c(29.65314, 28.72849 )# Seconda colonna
perc0917 <- c(9.832385, 48.29441) # Terza colonna
perc0323 <- c(33.67889, 24.6958 ) # Quarta colonna
perc0923 <- c(1.452039, 56.87872 ) # Quinta colonna
# Creazione del dataframe multitemporale
multitemporal_conf <- data.frame(classi, perc0317, perc0917, perc0323, perc0923 )
View(multitemporal_conf) # Visualizzazione del dataframe

# DATAFRAME CON LE PERCENTUALI DI NEVE E VEGETAZIONE PER I 4 PERIODI
# Creazione di un dataframe con le percentuali di neve e vegetazione per i diversi periodi dell'anno
# (gli anni verranno visualizzati nelle righe)
Anni <- c("marzo 2017", "settembre 2017", "marzo 2023", "settembre 2023") # Prima colonna, periodi di tempo
PercNeve <- c(29.65314, 9.832385, 33.67889, 1.452039 ) # Seconda colonna, percentuali di neve
PercVegetazione <- c(28.72849, 48.29441, 24.6958, 56.87872) # Terza colonna, percentuali di vegetazione
# Creazione del dataframe per le percentuali di neve e vegetazione
multitemporal1 <- data.frame(Anni, PercNeve, PercVegetazione)
View(multitemporal1)

# DATAFRAME PER BARCHART COMBINATO
# Creazione di un dataframe per la visualizzazione delle percentuali di neve e vegetazione in un unico grafico a barre
Anno <- c("marzo 2017", "marzo 2017", "settembre 2017", "settembre 2017", "marzo 2023", "marzo 2023", "settembre 2023", "settembre 2023") # Prima colonna, Periodi di tempo
Percentuali <- c(29.65314, 28.72849, 9.832385, 48.29441, 33.67889, 24.6958, 1.452039, 56.87872) # Seconda colonna, percentuali di neve e vegetazione
Tipo_copertura <- c("Neve", "Vegetazione", "Neve", "Vegetazione", "Neve", "Vegetazione", "Neve", "Vegetazione") # Terza colonna, tipo di copertura
# Creazione del dataframe per il grafico a barre combinato
multitemporal2 <- data.frame(Anno, Percentuali, Tipo_copertura)
View(multitemporal2)

# BARCHART NEVE NEI 4 ANNI
# Creazione di un grafico a barre per visualizzare le percentuali di neve nei diversi periodi
ggplot(multitemporal1, aes(x=Anni, y=PercNeve, col=Anni))+
  geom_bar(stat="identity", fill="white")

# BARCHART VEGETAZIONE NEI 4 ANNI
# Creazione di un grafico a barre per visualizzare le percentuali di vegetazione nei diversi periodi
ggplot(multitemporal1, aes(x=Anni, y=PercVegetazione, col=Anni))+
  geom_bar(stat="identity", fill="white")

# Creazione di un grafico a barre a colonne multiple per visualizzare le percentuali di neve e vegetazione per ciascun periodo
ggplot(multitemporal2, aes(x=Anno, y=Percentuali, col=Tipo_copertura))+
  geom_bar(stat="identity", fill="white") # Colonne sovrapposte

# Personalizza i colori delle colonne per migliorare la leggibilità.
bordo_barplot <- c("Neve" = "lightblue", "Vegetazione" = "darkgreen")

# Risultato finale usato in presentazione
ggplot(multitemporal2, aes(x=Anno, y=Percentuali, col=Tipo_copertura))+
  geom_bar(stat="identity", position="dodge", fill="white",aes(color = Tipo_copertura)) +
  scale_color_manual(values = bordo_barplot) # Colonne affiancate
# "dodge" crea colonne affiancate per una chiara distinzione tra le due categorie di copertura (neve e vegetazione).


# FACCIO LO STESSO PROCEDIMENTO SULL'AREA DELL'ADAMELLO AL FINE DI COMPARARE I RISULTATI
# L'area dell'Adamello rientra nelle immagini già scaricate in precedenza
# Carico il shapefile dell'area Adamello
adamello <- st_read("adamello.shp")
adamello

# Marzo 2017
# Ritaglio l'immagine dell'area Adamello 
adamellocut0317 <- crop(forni0317, adamello)
# Visualizzo l'immagine ritagliata
adamellocut0317
plot(adamellocut0317)
plotRGB(adamellocut0317, r=4, g=3, b=2, stretch="lin")
plotRGB(adamellocut0317, r=5, g=4, b=3, stretch="lin")

# Applico la funzione mask 
adam0317d <- mask(adamellocut0317, adamello)
plot(adam0317d)
plotRGB(adam0317d, r=4, g=3, b=2, stretch="lin")
plotRGB(adam0317d, r=5, g=4, b=3, stretch="lin")

#Faccio gli stessi procedimenti per tutte le altre immagini
# Marzo 2023
adamellocut0323 <- crop(forni0323, adamello)
adamellocut0323
plot(adamellocut0323)
plotRGB(adamellocut0323, r=4, g=3, b=2, stretch="lin")
plotRGB(adamellocut0323, r=5, g=4, b=3, stretch="lin")

adam0323d <- mask(adamellocut0323, adamello)
plot(adam0323d)
par(mfrow=c(1, 2))
plotRGB(adam0323d, r=4, g=3, b=2, stretch="lin")
plotRGB(adam0323d, r=5, g=4, b=3, stretch="lin")

# Settembre 2023
adamellocut0923 <- crop(forni0923, adamello)
adamellocut0923
plot(adamellocut0923)
plotRGB(adamellocut0923, r=4, g=3, b=2, stretch="lin")
plotRGB(adamellocut0923, r=5, g=4, b=3, stretch="lin")

adam0923d <- mask(adamellocut0923, adamello)
plot(adam0923d)
par(mfrow=c(1, 2))
plotRGB(adam0923d, r=4, g=3, b=2, stretch="lin")
plotRGB(adam0923d, r=5, g=4, b=3, stretch="lin")

# Settembre 2017
adamellocut0917 <- crop(forni0917, adamello)
adamellocut0917
plot(adamellocut0917)
plotRGB(adamellocut0917, r=4, g=3, b=2, stretch="lin")
plotRGB(adamellocut0917, r=5, g=4, b=3, stretch="lin")

adam0917d <- mask(adamellocut0917, adamello)
plot(adam0917d)
par(mfrow=c(1, 2))
plotRGB(adam0917d, r=4, g=3, b=2, stretch="lin")
plotRGB(adam0917d, r=5, g=4, b=3, stretch="lin")

# Plot per la visualizzazione in colori naturali delle quattro immagini scaricate a colori naturali
par(mfrow=c(2, 2))
plotRGB(adam0317d, r=4, g=3, b=2, stretch="lin")
plotRGB(adam0323d, r=4, g=3, b=2, stretch="lin")
plotRGB(adam0917d, r=4, g=3, b=2, stretch="lin")
plotRGB(adam0923d, r=4, g=3, b=2, stretch="lin")

adam0317d
adam0323d
adam0917d
adam0923d

# Calcolo degli indici spettrali (DVI, NDVI, NDGI, NDSI) per analizzare le condizioni del ghiacciaio
# DVI = Differenza Vegetation Index, NDVI = Normalized Difference Vegetation Index
# Immagine settembre 2023
adam_dvi0923 <- adam0923d[[5]]-adam0923d[[4]]
adam_dvi0923
adam_ndvi0923 <- adam_dvi0923/(adam0923d[[5]]+adam0923d[[4]])
adam_ndvi0923

# Ripetiamo il calcolo per le immagini di altre date
# Immagine marzo 2023
adam_dvi0323 <- adam0323d[[5]]-adam0323d[[4]]
adam_dvi0323
adam_ndvi0323 <- adam_dvi0323/(adam0323d[[5]]+adam0323d[[4]])
adam_ndvi0323

# Immagine settembre 2017
adam_dvi0917 <- adam0917d[[5]]-adam0917d[[4]]
adam_dvi0917
adam_ndvi0917 <- adam_dvi0917/(adam0917d[[5]]+adam0917d[[4]])
adam_ndvi0917

# Immagine marzo 2017
adam_dvi0317 <- adam0317d[[5]]-adam0317d[[4]]
adam_dvi0317
adam_ndvi0317 <- adam_dvi0317/(adam0317d[[5]]+adam0317d[[4]])
adam_ndvi0317

# Visualizziamo gli indici NDVI
par(mfrow=c(2, 2))
plot(adam_ndvi0317, col=viridis(200, option="F")) # Visualizzazione con la palette viridis Rocket
plot(adam_ndvi0323, col=viridis(200, option="F")) 
plot(adam_ndvi0917, col=viridis(200, option="F")) 
plot(adam_ndvi0923, col=viridis(200, option="F")) 

# Calcolo del NDSI (Normalized Difference Snow Index)
# Formula: (green - SWIR 1) / (green + SWIR 1)
# Calcolo del NDSI per i dati di settembre 2023
adam_ndsi0923 <- (adam0923d[[3]]-adam0923d[[6]])/(adam0923d[[3]]+adam0923d[[6]])
# Visualizzazione del risultato per settembre 2023
adam_ndsi0923
# Calcolo del NDSI per i dati di marzo 2023
adam_ndsi0323 <- (adam0323d[[3]]-adam0323d[[6]])/(adam0323d[[3]]+adam0323d[[6]])
adam_ndsi0323
# Calcolo del NDSI per i dati di settembre 2017
adam_ndsi0917 <- (adam0917d[[3]]-adam0917d[[6]])/(adam0917d[[3]]+adam0917d[[6]])
adam_ndsi0917
# Calcolo del NDSI per i dati di marzo 2017 
adam_ndsi0317 <- (adam0317d[[3]]-adam0317d[[6]])/(adam0317d[[3]]+adam0317d[[6]])
adam_ndsi0317

# Plot del NDSI
par(mfrow=c(2, 2))
plot(adam_ndsi0317, col=viridis(200, option="G")) # Utilizza la funzione viridis con la palette "G" (Mako)
plot(adam_ndsi0323, col=viridis(200, option="G")) 
plot(adam_ndsi0917, col=viridis(200, option="G")) 
plot(adam_ndsi0923, col=viridis(200, option="G")) 

#CLASSIIFCAZIONE
# Richiediamo di suddividerle in 3 classi (nClasses=3) che rappresentano neve, neve sporca e vegetazione
# Classificazione per l'immagine di marzo 2017
a_class0317 <- unsuperClass(adam0317d, nClasses=3) 
# Mostra il risultato della classificazione
a_class0317
a_class0917 <- unsuperClass(adam0917d, nClasses=3) 
a_class0917
a_class0323 <- unsuperClass(adam0323d, nClasses=3) 
a_class0323
a_class0923 <- unsuperClass(adam0923d, nClasses=3) 
a_class0923

# Visualizzazione delle classificazioni in un layout a 4 grafici, con colori generati dalla palette E di viridis (cividis)
par(mfrow=c(2, 2))
plot(a_class0317$map, col=viridis(4, option="E")) 
plot(a_class0323$map, col=viridis(4, option="E")) 
plot(a_class0917$map, col=viridis(4, option="E")) 
plot(a_class0923$map, col=viridis(4, option="E"))  

# Analisi delle frequenze delle classi ottenute per ciascuna immagine
# Marzo 2017
freq(a_class0317$map) # conto dei pixel appartenenti a ciascuna classe
# Classe 1= neve sporca -> 206219
# Classe 2= neve -> 194899
# Classe 3= vegetazione -> 648189

# Settembre 2017
freq(a_class0917$map)
# Classe 1= suolo nudo  -> 392580
# Classe 2= neve -> 55859
# Classe 3= vegetazione -> 604157

# Marzo 2023
freq(a_class0323$map)
# Classe 1= vegetazione  -> 568023
# Classe 2= neve sporca -> 215780
# Classe 3= neve -> 268153

# Settembre 2023
freq(a_class0923$map)
# Classe 1= suolo nudo  -> 436910
# Classe 2= neve -> 23057
# Classe 3= vegetazione -> 592149

# Numero totale di pixel
# Il numero totale di pixel per ciascuna immagine è lo stesso: 2173908.

adam0317d # Informazioni sul raster di marzo 2017
tot_adam0317 <- 2306484 # Numero totale di pixel per l'immagine di marzo 2017
adam0917d
tot_adam0917 <- 2306484
adam0323d
tot_adam0323 <- 2306484
adam0923d
tot_adam0923 <- 2306484

# Percentuale di copertura neve-ghiaccio
# Calcolo della percentuale di neve e ghiaccio presente per ciascuna immagine
ice_adam0317 <- (206219+194899)/tot_adam0317*100 
ice_adam0317
# 17.39089
ice_adam0917 <- (55859)/tot_adam0917*100 
ice_adam0917
#2.421825
ice_adam0323 <- (215780+268153)/tot_adam0323*100 
ice_adam0323
#20.98142
ice_adam0923 <- (23057)/tot_adam0923*100 
ice_adam0923
#0.9996601

# Percentuale di vegetazione
# Calcola della percentuale di vegetazione presente per ciascuna immagine
veg_adam0317 <- (648189)/tot_adam0317*100 
veg_adam0317
# 28.1029
veg_adam0917 <- (604157+392580)/tot_adam0917*100 
veg_adam0917
#43.21456
veg_adam0323 <- (568023)/tot_adam0323*100 
veg_adam0323
#24.62722
veg_adam0923 <- (436910+592149)/tot_adam0923*100 
veg_adam0923
#44.61592

# DATAFRAME
# Creazione di un dataframe con le percentuali di neve e vegetazione per ciascuna data di rilevamento
classi <- c("Neve%", "Vegetazione%") # Prima colonna, nome delle classi di copertura
# Percentuali di neve e vegetazione per ciascun periodo
perc_adam0317 <- c(17.39089, 28.1029 )# Seconda colonna
perc_adam0917 <- c(2.421825, 43.21456) # Terza colonna
perc_adam0323 <- c(20.98142, 24.62722 ) # Quarta colonna
perc_adam0923 <- c(0.9996601, 44.61592) # Quinta colonna
# Creazione del dataframe multitemporale
multitemporal_conf_a <- data.frame(classi, perc_adam0317, perc_adam0917, perc_adam0323, perc_adam0923)
View(multitemporal_conf_a)

# DATAFRAME CON LE PERCENTUALI DI NEVE E VEGETAZIONE PER I 4 PERIODI
# Creazione di un dataframe con le percentuali di neve e vegetazione per i diversi periodi dell'anno
Anni <- c("marzo 2017", "settembre 2017", "marzo 2023", "settembre 2023") # Prima colonna, periodi di tempo
PercNeve <- c(17.39089,2.421825 , 20.98142, 0.9996601 ) # Seconda colonna, percentuali di neve
PercVegetazione <- c(28.1029, 43.21456, 24.62722, 44.61592) # Terza colonna, percentuali di vegetazione

# Creazione del dataframe per le percentuali di neve e vegetazione
al1_a <- data.frame(Anni, PercNeve, PercVegetazione)
View(multitemporal1_a)

# DATAFRAME PER BARCHART combinato
# Creazione di un dataframe per la visualizzazione delle percentuali di neve e vegetazione in un unico grafico a barre
Anno <- c("marzo 2017", "marzo 2017", "settembre 2017", "settembre 2017", "marzo 2023", "marzo 2023", "settembre 2023", "settembre 2023") # Prima colonna
Percentuali <- c(17.39089, 28.1029, 2.421825, 43.21456, 20.98142, 24.62722, 0.9996601, 44.61592 ) # Seconda colonna
Tipo_copertura <- c("Neve", "Vegetazione", "Neve", "Vegetazione", "Neve", "Vegetazione", "Neve", "Vegetazione") # Terza colonna
# Creazione del dataframe per il grafico a barre combinato
multitemporal2_a <- data.frame(Anno, Percentuali, Tipo_copertura)
View(multitemporal2_a)

# BARCHART NEVE NEI 4 ANNI
ggplot(multitemporal1_a, aes(x=Anno, y=PercNeve, col=Anno))+
  geom_bar(stat="identity", fill="white")

# BARCHART VEGETAZIONE NEI 4 ANNI
ggplot(multitemporal1_a, aes(x=Anno, y=PercVegetazione, col=Anno))+
  geom_bar(stat="identity", fill="white")

# Personalizzazione dei colori delle colonne 
bordo_barplot <- c("Neve" = "lightblue", "Vegetazione" = "darkgreen")

# Creazione di un grafico a barre a colonne multiple per visualizzare le percentuali di neve e vegetazione per ciascun periodo
ggplot(multitemporal2_a, aes(x=Anno, y=Percentuali, col=Tipo_copertura))+
  geom_bar(stat="identity", position="dodge", fill="white", aes(color = Tipo_copertura)) +
  scale_color_manual(values = bordo_barplot)
  # Colonne affiancate

# Confronto l'indice NDSI per i periodi estivi delle due aree esaminate
# Creazione di una griglia di grafici 2x2 per visualizzare l'indice NDSI
par(mfrow=c(2,2))
# Plot dell'indice NDSI per settembre 2017 (area Forni)
plot(ndsi0917, col=viridis(200, option="G")) 
# Plot dell'indice NDSI per settembre 2023 (area Forni)
plot(ndsi0923, col=viridis(200, option="G")) 
# Plot dell'indice NDSI per settembre 2017 (area Adamello)
plot(adam_ndsi0917, col=viridis(200, option="G")) 
# Plot dell'indice NDSI per settembre 2023 (area Adamello)
plot(adam_ndsi0923, col=viridis(200, option="G")) 
# Questo confronto visivo consente di analizzare le variazioni dell'indice NDSI tra le due aree e tra i due periodi estivi.

# DATAFRAME per confronto estati tra le due aree
# Creazione di un dataframe per valutare la perdita di copertura di ghiaccio e neve tra le aree Forni e Adamello
classi <- c("Neve%", "Vegetazione%") # Prima colonna, classi di copertura
perc0917 <- c(9.832385, 48.29441) # Terza colonna, percentuali per settembre 2017 (Forni)
perc0923 <- c(1.452039, 56.87872 ) # Quinta colonna, percentuali per settembre 2023 (Forni)
perc_adam0917 <- c(2.421825, 43.21456) # Terza colonna, percentuali per settembre 2017 (Adamello)
perc_adam0923 <- c(0.9996601, 44.61592) # Quinta colonna, percentuali per settembre 2023 (Adamello)
# Creazione del dataframe con i dati
multitemporal_conf_fa <- data.frame(classi, perc0917, perc0923, perc_adam0917, perc_adam0923)
View(multitemporal_conf_fa)
# Questo dataframe consente di confrontare le percentuali di neve e vegetazione tra le due aree per i diversi anni
# Facilita l'analisi dei cambiamenti nella copertura di ghiaccio e vegetazione.

# Creazione di un dataframe per il confronto delle percentuali di neve e e vegetazione tra le aree e i periodi
Anni <- c("Ortles 09-2017", "Ortles 09-2023", " Adamello 09-2017", " Adamello 09-2023") # Prima colonna con i periodi e le aree
PercNeve <- c(9.832385, 1.452039, 2.421825, 0.9996601) # Seconda colonna con le percentuali di neve
PercVegetazione <- c(48.29441, 56.87872, 43.21456, 44.61592) # Terza colonna con le percentuali di vegetazione

# Creazione dataframe
multitemporal_fa <- data.frame(Anni, PercNeve, PercVegetazione)
View(multitemporal_fa)
# Visualizzazione del dataframe per controllare i dati

# Creazione di un grafico a barre  per visualizzare le percentuali di neve
# Specifichiamo che le barre rappresentano le percentuali di neve come valori individuali e hanno uno sfondo bianco.
ggplot(multitemporal_fa, aes(x=Anni, y=PercNeve, col=Anni))+
  geom_bar(stat="identity", fill="white") 

# MISURE DI ETEROGENEITÀ: PCA
# Area ghiacciaio dei Forni
# Ridimensionamento dell'immagine per velocizzare le esecuzioni successive
# Aggrega l'immagine a una risoluzione più bassa, riducendo il numero di pixel
# Resample, per rendere più veloci le esecuzioni successive
forni0917dres <- aggregate(forni0917d, fact=5)
forni0923dres <- aggregate(forni0923d, fact=5)

# CALCOLO DELLA PCA
# PCA per settembre 2017
pca_forni17 <- rasterPCA(forni0917dres) 
# PCA per settembre 2023
pca_forni23 <- rasterPCA(forni0923dres) 
# Visualizzazione dei risultati della PCA
pca_forni17
pca_forni23

# riepilogo delle statistiche relative alle componenti principali ottenute dall'analisi.
summary(pca_forni17$model) # La PC1 (2017) spiega il  92.64%  della variabilità del sistema
summary(pca_forni23$model) # La PC1 (2023) spiega il 56.92% della variabilità del sistema 

# Plot delle mappe delle componenti principali
plot(pca_forni17$map)
plot(pca_forni23$map)
# Associazione delle componenti principali (PC1) a variabili per facilitare i passaggi successivi
pc1_17 <- pca_forni17$map$PC1
pc1_23 <- pca_forni23$map$PC1

# Plot delle componenti principali PC1 per settembre 2017 e settembre 2023 con palette C di viridis (plasma)
par(mfrow=c(1,2))
plot(pc1_17, col=viridis(200, option="C"))
plot(pc1_23, col=viridis(200, option="C")) 

# Calcolo della variabilità della PC1 utilizzando una moving window di 3x3
# Questo aiuta a capire l'eterogeneità locale nella variabilità della PC1
sdpc1_17 <- focal(pc1_17, matrix(1/9, 3, 3), fun=sd)
sdpc1_17
sdpc1_23 <- focal(pc1_23, matrix(1/9, 3, 3), fun=sd) 
sdpc1_23

# Plot della variabilità della PC1 per settembre 2017 e settembre 2023
# Le mappe mostrano la variabilità spaziale della PC1
par(mfrow=c(1,2))
plot(sdpc1_17, col=viridis(200, option="B")) # utilizzando la palette B (inferno) di viridis
plot(sdpc1_23, col=viridis(200, option="B"))
# Dalle immagini risulta una variabilità maggiore nel 2017, con aree molti più pixel con valori elevati di eterogeneità (giallo) 
# Le aree con valori alti di eterogeneità sono principalemte i margini glaciali, che delimitano le zone di ghiacciaio molto omogenee.
# Nel 2023 le aree eterogenee sono notevolmente diminuite, segno di una diminuzione dei margini glaciali e del suolo nudo più omogeneo emerso dal ritiro dei ghiacciai

# MISURE DI ETEROGENEITA': PCA
# Area ghiacciaio Adamello
# seguo esattamente gli stessi passaggi descritti sopra
adam0917d
adam0923d
adam0917dres <- aggregate(adam0917d, fact=5)
adam0923dres <- aggregate(adam0923d, fact=5)

# PCA
pca_adam17 <- rasterPCA(adam0917dres) # settembre 2017
pca_adam23 <- rasterPCA(adam0923dres) # settembre2023
pca_adam17
pca_adam23
summary(pca_adam17$model) # La PC1 (2017) spiega il  87.61%  della variabilità del sistema
summary(pca_adam23$model) # La PC1 (2023) spiega il 63,15% della variabilità del sistema

plot(pca_adam17$map)
plot(pca_adam23$map)
# Si associa ciascuna PC1 a un oggetto, per facilitare i passaggi successivi
pc1_a17 <- pca_adam17$map$PC1
pc1_a23 <- pca_adam23$map$PC1

par(mfrow=c(1,2))
plot(pc1_a17, col=viridis(200, option="C"))
plot(pc1_a23, col=viridis(200, option="C")) 
# Calcolo della variabilità della PC1 utilizzando una moving window di 3x3
sdpc1_a17 <- focal(pc1_a17, matrix(1/9, 3, 3), fun=sd)
sdpc1_a17
sdpc1_a23 <- focal(pc1_a23, matrix(1/9, 3, 3), fun=sd) 
sdpc1_a23

par(mfrow=c(1,2))
plot(sdpc1_a17, col=viridis(200, option="B"))
plot(sdpc1_a23, col=viridis(200, option="B"))
# Nel 2017 sono molto evidenti i ghiacciai come grandi zone omogenee circondate da margini molto definiti con valori alti di eterogeneità. 
# Nel 2023 i margini glaciali si sono modificati risultando più irregolari e diminuendo di estensione. 
# L'mmagine del 2023 riuslta avere anche altre zone con valori medi di eterogeneità ma sono tutti i crinali con versanti in ombra. I valori altri di eterogeneità rimangono sui margini glaciali

# Confronto PC1 tra Forni e Adamello
# Creazione di una griglia di grafici 2x2 per visualizzare la variabilità della PC1
par(mfrow=c(2,2))
plot(sdpc1_17, col=viridis(200, option="B")) # palette "B" (inferno) di viridis
plot(sdpc1_23, col=viridis(200, option="B"))
plot(sdpc1_a17, col=viridis(200, option="B"))
plot(sdpc1_a23, col=viridis(200, option="B"))
# Questo confronto visivo permette di osservare e confrontare la variabilità spaziale della componente principale PC1
# Possiamo ipotizzare dalla immagini prodotte che l'area dell'Adamello sia oggi molto soggetto ai cambiamenti climatici, mentre nel 2017, seppur con segni di regressione, era ancora in buono stato.
# Al contrario il gruppo dell' Ortles sembrava già subire molto i cambiamenti climatici nel 2017 come mostrano gli elevati valori di variabilità, e al 2023 i corpi glaciali rimasti risultano pochi, di piccole dimesioni e in forte sofferenza.
# Queste differenze tra le due aree potrebbero essere causate: dalla maggior dimensione del ghiacciaio dell'Adamello e dalla tipologia di ghiacciaio ( es: Adamello di tipo Scandinavo, Forni: di tipo Himalayano)
