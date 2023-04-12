library(rnaturalearth)
library(ggplot2)
library(maptools)
library(raster)
library(rgdal)
library(rgeos)
library(RColorBrewer)
library(dplyr)
library(geodata)
library(geobr)

#MUNDIAL
terra<-getData('worldclim', var='alt', res=10)
cores <-c('#bcd2a4','#89d2a4','#28a77e',
          '#90b262','#ddb747','#fecf5b',
          '#da9248','#b75554','#ad7562',
          '#b8a29a','#9f9e98')

cores <- colorRampPalette(cores)(250)

plot(terra,col=cores,
     legend.width= 1.5,  axis.args=list(cex.axis=0.6),
     legend.args=list(text="Altitude (mt)",
                      side=3, line=0.5, cex=0.8))

#CONTINENTAL
continente<-ne_countries(continent  = 'south america' , returnclass = 'sf')
altitude<- getData('worldclim', var='alt' , res=10)
sam<-crop(altitude,continente)

cores <- colorRampPalette(cores)(250)

plot(sam,col=cores,
     legend.width= 1.5,  axis.args=list(cex.axis=0.6),
     legend.args=list(text="Altitude (mt)",
                      side=3, line=0.5, cex=0.8))
#PAÍS
mada<-getData('alt', country='Madagascar', mask=TRUE) 

cores <- colorRampPalette(cores)(250)

plot(mada,col=cores,
     legend.width= 1.5,  axis.args=list(cex.axis=0.6),
     legend.args=list(text="Altitude (mt)",
                      side=3, line=0.5, cex=0.8))
#ESTADO
pi<-read_state(code_state = "PI", year= 2010)
topo<-get_elev_raster(pi,z=8,clip ='location')
cores <- colorRampPalette(cores)(250)

plot(pi$geom)+
  plot(topo,add=T,col=cores,legend.width= 1.5,axis.args=list(cex.axis=0.6),
       legend.args=list(text="Altitude (mt)",
                        side=3, line=0.5, cex=0.8),title('Hipsometria do Estado do Piauí'))

