########################
###LAB API DATAMEXICO###
########################
# Hecho con guto por Juan Antonio González Sierra

########################
###LAB API DATAMEXICO###
########################

#Instala la paqueteria de jsonlite
install.packages("jsonlite")

#Llamar a la paqueteria
library("jsonlite")

#Buscar tu archivo descargado
file.choose()

#Traer el archivo
datos_api2 <- fromJSON("C:\\Users\\jagon\\Desktop\\Doctorado\\4to semestre\\Modulo 2\\Laboratorios\\JAGS_LAB58 Uso de la API Data Mèxico\\JAGS_LAB58\\Inputs\\Municipality-Year-records.json")
class(datos_api2)
names(datos_api2)


#Intento de pasarlo a Dataframe (no pude)
datos_api2 <- lapply(datos_api2, function(x) {
  x[sapply(x, is.null)] <- NA
  unlist(x)
})

#df<-as.data.frame(do.call("cbind", datos_api2))
library(DT)
datatable(head(df))

#Bajo mi fracaso
write_csv(df,"intentofracasodf.csv")
