library(purrr)
trees %>% View()
#calcular la mediana de todas las variables usando purrr
map_dbl(trees,median)
#calcular la media sin usar ciclos
map_dbl(trees,mean)
map_dbl(trees,mean,na.rm=TRUE)#eliminar los NA

