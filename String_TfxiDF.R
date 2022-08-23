#Strings- Operaciones
library(stringr)

#Extraer una sub cadena,longitud y ordenar

cadena=c("Esto es una cadena.","Año 2022","Aprendiendo R","Este año")
str_sub(cadena,1,3) #[1] "Est" "Año" "Apr"
sort(cadena)        #[1] "Año 2022"  "Aprendiendo R" "Esto es una cadena."
length(cadena)      #[1] 3

#Encontrar un patron al principio(^) a al final($) de una cadena usando comodines
str_view(cadena,"^E")
str_view(cadena,"o$")

#Contar coincidencias
str_count(cadena,"^E")#[1] 1 0 0 1

#Detectar coincidencias,booleano
str_detect(cadena,"^E")

#Detectar coincidencias,devuelve cadena real
str_subset(cadena,"^E") #[1] "Esto es una cadena." "Este año"  

#Extraer coincidencias de acuerdo a patron
str_extract #[1] "Es" NA   NA   "Es"

#replace
str_replace(cadena,"^Esto","Esta")

#Buscar conjunto de caracteres
str_view_all(cadena,"[a,e,i,o,u]")
str_view_all(tolower(cadena),"^[a,e,i,o,u]") 
str_view_all(cadena,"[a,e,i,o,u]$")

#Buscar cualquier cosa que no sea una vocal
str_view_all(cadena,"[^aeiou]")

#Buscar digitos
str_view_all(cadena,"\\d")

#Buscar espacios en blanco
str_view_all(cadena,"\\s")

#Repeticion dentro de expresiones regulares
str_view_all(cadena,"r+")
str_view_all(cadena,"d+")
str_view_all(cadena,"d\\*")
str_view_all(cadena,"d{2,3}")

#Package glue
#Pasar directamente una variable a una cadena
install.packages("glue")
library(glue)
library(dplyr)
msleep %>% View()

nombre="Manuel"
glue("Mi nombre es {nombre}")

#añadir una columna para describir algo
msleep %>% mutate(descripcion = glue("El {name} generalmente duerme {sleep_total*60} minutos
                                       y esta despierto aproximadamente {awake*60} minutos por dia."))%>% 
select("Nombre" = name,"Horas de sueño"=sleep_total,"Horas de vigilia"=awake,descripcion)

#Tokenizacion
install.packages("tidytext")
library(tidytext)
library(tibble)

P_Neruda_1 <- c("Me gustas cuando callas porque estás como ausente",
            "y me oyes desde lejos, y mi voz no te toca",
             "Parece que los ojos se te hubieran volado",
             "y parece que un beso te cerrara la boca")

P_Neruda_2 <-c("Como todas las cosas están llenas de mi alma",
               "emerges de las cosas, llena del alma mía.",
               "Mariposa de sueño, te pareces a mi alma,",
               "y te pareces a la palabra melancolía.")
  
P_Neruda_3 <-c("Me gustas cuando callas y estás como distante",
               "Y estás como quejándote, mariposa en arrullo.",
               "Y me oyes desde lejos, y mi voz no te alcanza:",
                 "déjame que me calle con el silencio tuyo")

data_text1= tibble(line = 1:4,text = P_Neruda_1,title="Poema_N°15_verso_1")
data_text2= tibble(line = 1:4,text = P_Neruda_2,title="Poema_N°15_verso_2")
data_text3= tibble(line = 1:4,text = P_Neruda_3,title="Poema_N°15_verso_3")

#Convertir cada fila a un Token(Tokenizacion)

data_text1 %>% unnest_tokens(word2,text)
data_text2 %>% unnest_tokens(word2,text)
data_text3 %>% unnest_tokens(word2,text)

#Analisis de Texto Tf x iDF
#Combinar los tres textos para hacer el analisis

poemas = bind_rows(data_text1,data_text2,data_text3)
view(poemas)
#Contar el numero de palabras repetidas de cada poema
poem_num = poemas %>% unnest_tokens(word,text) %>% 
                      count(title,word,sort = TRUE)

#Contar el numero total de palabras en cada poema
poem_tot = poem_num %>% group_by(title) %>% 
                        summarize(total = sum(n))

#Combinar los data frame ,uniendo con un join,joining por title
poem_num = left_join(poem_num,poem_tot)
