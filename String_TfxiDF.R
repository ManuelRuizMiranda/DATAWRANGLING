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
