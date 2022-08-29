library(readr)
library(janitor)
library(skimr)
library(dplyr)
#Importar dataset y normalizar nombres a snake_case
trips_2020 <- read_csv("C:/BOOTCAMP/Data_wrangling/Modulo 4/trips_2020.csv") %>% 
                    clean_names('snake') 
View(trips_2020)

#Explorar variables
skim(trips_2020)
trips_2020 %>% count(id_usuario) %>% sort()
