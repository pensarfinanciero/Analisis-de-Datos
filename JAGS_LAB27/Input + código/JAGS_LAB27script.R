Hecho con gusto por Juan Antonio González Sierra (UAEH)

# LABORATORIO - Tidy data -datos ordenados- PARTE 1,2 y 3.

# Objetivo: Introducción práctica a los datos ordenados (o tidy data) y a las herramientas que provee el paquete tidyr.
# --------------------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar datos (tibbles)
# 2. Converir nuestros tiblles en dataframes (para su exportación)
# 3. Exportar dataframes originales
# 4. Pivotar tabla 4a
# 5. Exportar resutltado (TABLA PIVOTANTE)
# 6. Separar y unir tablas

#############################################
#LABORATORIO: Tidy data (datos ordenados) 1 #
#############################################
#Prerrequisitos
#instalar paquete tidyverse
#install.packages("tidyverse")


#instalar paquete de datos

#install.packages("remotes")
#remotes::install_github("cienciadedatos/datos")
#install.packages("datos")

#Cargar paquete tidyverse
library(tidyverse)

#Cargar paquete de datos
library(datos)

#tabla 1 hasta tabla 4b
#ver datos como tibble 
datos :: tabla1
datos :: tabla2
datos :: tabla3
datos :: tabla4a
datos :: tabla4b

#ver datos como dataframe 
df1 <- data_frame(tabla1)
df2 <- data_frame(tabla2)
df3 <- data_frame(tabla3)
df4a <- data_frame(tabla4a)
df4b <- data_frame(tabla4b)

#exportar los dataframes originales
write.csv(df1, file = "df1.csv")
write.csv(df2, file = "df2.csv")
write.csv(df3, file = "df3.csv")
write.csv(df4a, file = "df4a.csv")
write.csv(df4b, file = "df4b.csv")

vignette("tibble")
#explicación de tibble
#la mayoria de las fnciones que utilizaras en este libro producen
#tibbles, ya que son una de las caracteristicas trasversales del tidyverse
#si ya heas familiarizado con data.frame(), es importante que tomes en cuenta que tibble() hace menos cosas:
#nunca cambia el tipo de los inputs (p. ej.), nunca convierte caracteres en facotres),
#nunca cambia el nombre de las variables nunca asigna nombres a las filas

# Ordenar datos con la tabla4a (PIVOTAR)
t4a_pivotante = tabla4a %>%
  pivot_longer(cols = c("1999" , "2000"), names_to = "anio", values_to = "casos")

# Exportar resultado: tabla ordenada
write.csv(t4a_pivotante, file = "t4a_pivotante.csv")