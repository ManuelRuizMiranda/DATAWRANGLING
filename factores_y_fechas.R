#Crear Factor
library(tidyverse)
library(forcats)
library(ggplot2)

meses_orden<-c("enero","febrero","marzo","abril","mayo","junio","julio",
                "agosto","septiembre","octubre","noviembre","diciembre")

meses_fac<-factor(meses,levels=meses_orden)

meses<-c("diciembre","enero","febrero","marzo","mayo","julio","junio",
        "agosto","octubre")       

# Ordenar por Orden de factores
sort(meses_fac)      
     
 #Ordenar viveles factores por frecuencia     
library(janitor)  
chickwts
view(chickwts)
tabyl(chickwts$feed)
fct_infreq(chickwts$feed) %>% head()
#niveles de ordenes basados en la frecuencia en el dataset
#Levels: soybean casein linseed sunflower meatmeal horsebean,del mas al menos frecuente
#fct_rev

#Reordenacion de niveles de factores por otra variable

chickwts %>% 
  mutate(alimento = fct_reorder(feed,weight)) %>%  
  ggplot(.,aes(alimento,weight))+geom_point()




