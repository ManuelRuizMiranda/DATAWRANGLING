library(skimr)
library(tidyverse)
library(ggplot2)
#Estudio de caso ,descubrir valores outliers,valores perdidos(missing)
df=read.csv('C:/BOOTCAMP/Data_wrangling/EDA/athlete_events.csv',header = TRUE)
#view(df,n=10)
skim(df) %>% summary()
skim
#Generar histograma de la variable Edad
ggplot(df,aes(x=Age))+geom_histogram(color="black",fill="white",bins = 30,
                                     binwidth = 0.01)
#Relacion entre la edad de los atletas y su genero mediante un Boxplot
ggplot(df,aes(x=Sex,y=Age))+geom_boxplot(lwd=1.5)

