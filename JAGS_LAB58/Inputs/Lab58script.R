##########################
### LAB API DATAMEXICO ###
##########################

# Hecho con gusto por Juan Antonio Gonz�lez Sierra

# Estudiante del Doctorado en Ciencias Econ�mico Administrativas de la UAEH

# Materia: Temas Selectos III An�lisis de Datos

# Docente: Carla Carolina P�rez Hern�ndez

# A continuaci�n se va a trabajar con archivo en formato JSON que se descarga en la API de Data Mexico

# Instala la paqueteria de jsonlite
install.packages("jsonlite")

# Llamar a la paqueteria
library("jsonlite")

# Buscar tu archivo descargado en la computadora
file.choose()

# Traer el archivo al entorno de R
datos_api2 <- fromJSON("C:\\Users\\jagon\\Desktop\\Doctorado\\4to semestre\\Modulo 2\\Laboratorios\\JAGS_LAB58 Uso de la API Data M�xico\\JAGS_LAB58\\Inputs\\Municipality-Year-records.json")

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