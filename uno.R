library(tidyverse)

airquality %>% View()

##pivot_longer()/Formato largo
airquality = as_tibble(airquality)
largo = airquality %>%  pivot_longer(everything()) %>% view()

##Cambiar nombre de columnas en pivot_longer
largo=airquality %>% pivot_longer(everything(),names_to = "variable",values_to = "valores")
head(largo)

##Parcializar columnas
largo=airquality %>% pivot_longer(c(Ozone,Solar.R,Wind,Temp),names_to = "variable",values_to = "valores")
tail(largo)

##Usar pivot_wider para volver al formato de datos ancho
ancho=largo %>% pivot_wider(names_from = "variable",values_from = "valores")
view(ancho)

##glimpse, info del dataframe
library(ggplot2)
msleep %>% view()
glimpse(msleep)
library(janitor)

##Normalizar nombres de variable columna name
msleep$name= make_clean_names(msleep$name,"snake")
view(msleep$name)
view(msleep)

##Filtrar Columnas por variables

msleep %>% filter(order=="Primates")
msleep %>% filter(order=="Primates") %>% group_by(genus=="Macaca") 
msleep %>% filter(order=="Perissodactyla",sleep_total>=2.5)
msleep %>% filter(name=="horse",sleep_total<=2.5)

##Function select()
msleep %>% filter(order=="Primates") %>% 
  select(name,sleep_cycle,bodywt,sleep_total)%>% 
  arrange(sleep_total)

##Reordenar variables no numericas

msleep %>% filter(order=="Primates") %>% 
  select(name,sleep_cycle,bodywt,sleep_total)%>% 
  arrange(name)

##Mutate()
##Agregar una nueva columna con Mutate()

msleep = mutate(msleep,nuevo= sleep_rem*5)
msleep %>% mutate(nuevo= sleep_rem*5)

##Funciones de resumen de datos
#dplyr

glimpse(msleep)
str(msleep)
summary(msleep)
summarize(msleep)

##contar elementos de variables

msleep %>% group_by(order) %>% 
  select(order) %>% 
  summarize(N=n())

msleep %>% count(genus)

##obtener duplicados

msleep %>% get_dupes(genus,order) %>% view()

