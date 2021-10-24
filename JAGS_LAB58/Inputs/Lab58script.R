##########################
### LAB API DATAMEXICO ###
##########################

# Hecho con gusto por Juan Antonio González Sierra

# Estudiante del Doctorado en Ciencias Económico Administrativas de la UAEH

# Materia: Temas Selectos III Análisis de Datos

# Docente: Carla Carolina Pérez Hernández

# A continuación se va a trabajar con archivo en formato JSON que se descarga en la API de Data Mexico

# Instala la paqueteria de jsonlite
install.packages("jsonlite")

# Llamar a la paqueteria
library("jsonlite")

# Buscar tu archivo descargado en la computadora
file.choose()

# Traer el archivo al entorno de R
datos_api2 <- fromJSON("C:\\Users\\jagon\\Desktop\\Doctorado\\4to semestre\\Modulo 2\\Laboratorios\\JAGS_LAB58 Uso de la API Data Mèxico\\JAGS_LAB58\\Inputs\\Municipality-Year-records.json")

# Verificar como estan catalogados los datos (no es un dataframe)
class(datos_api2)
names(datos_api2)

# Visualizar los datos que queremos de json
View(datos_api2[["data"]])

# Convertir en Dataframe los datos que se requieren
final_API <- as.data.frame((datos_api2[["data"]]))

# Comprobar que es un Dataframe
class(final_API)

# Para bajar el archivo en formato .csv
write.csv(final_API, file = "final_API.CSV")