Hecho con gusto por Juan Antonio GonzÃÂ¡lez Sierra (UAEH)

# LABORATORIO - Tidy data -datos ordenados- PARTE 1,2 y 3.

# Objetivo: IntroducciÃÂ³n prÃÂ¡ctica a los datos ordenados (o tidy data) y a las herramientas que provee el paquete tidyr.
# --------------------------------------------------------------------------------------------------------------------
# En este ejercicio vamos a:
# 1. Cargar datos (tibbles)
# 2. Converir nuestros tiblles en dataframes (para su exportaciÃÂ³n)
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
#explicaciÃÂ³n de tibble
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

######PARTE 2######
####################
#                  #
#     Tidy data    #
#                  #
####################


#EJERCICIO 2: PIVOTAR Y UNIR TABLAS
#PARTE 2
# ver tabla4b

# 1. Pivotar tabla 4b "A LO LARGO"
t4b_pivotante = tabla4b %>%
  pivot_longer(cols = c("1999" , "2000"), names_to = "anio", values_to = "Poblacion")

# Unir tablas ordenadas
union_t4 = left_join(t4a_pivotante,t4b_pivotante)

# Exportar resultado: tabla4a + tabla4b (ordenada)
write.csv(union_t4, file = "union_t4.csv")

#EJERCICIO 3: DATOS ANCHOS CON TABLA 2
# 1. Pivotar tabla 2 "A LO ANCHO"

#VER TABLA 2

# Ordenar datos con la tabla 2 (PIVOTAR a lo ANCHO)
t2_ancha = tabla2 %>% 
  pivot_wider(names_from = tipo, values_from = cuenta)

# Exportar resultado: tabla ordenada
write.csv(t2_ancha, file = "t2_ancha.csv")

######PARTE 3######
####################
#                  #
#     Tidy data    #
#                  #
####################

#La tabla3, que tiene un problema diferente:
#tenemos una columna (tasa) que contiene dos variables (casos y poblacion).

#vER TABLA 3
#Separación 1
# Separar casos y población por default
SEPARADO_1 = tabla3 %>% 
  separate(tasa, into = c("Casos", "Poblacion"))

# separación 2
# Separar casos y población por caracter "/" "*" "-"
SEPARADO_2 = tabla3 %>% 
  separate(tasa, into = c("Casos", "Poblacion") , sep = "/")

#separación 3
# Separar siglo y año de la columna "anio" 
SEPARADO_3 = tabla3 %>% 
  separate(anio, into = c("Siglo", "Anio") , sep = 2)

# AHORA VAMOS A UNIR LA TABLA GENERADA ANTERIORMENTE
# VER TABLA "SEPARADO 3"

#Podemos usar unite() para unir las columnas siglo y anio creadas en el ejemplo anterior
UNION_1 = SEPARADO_3 %>% 
  unite(nueva, Siglo, Anio)

# En este caso también necesitamos el argumento sep. Por defecto,
#pondrá un guión bajo (_) entre los valores de las distintas columnas. Si no queremos ningún separador usamos ""
UNION_2 = SEPARADO_3 %>% 
  unite(nueva, Siglo, Anio , sep = "")

# Exportar resultado: UNION_1
write.csv(UNION_1, file = "UNION_1.csv")

# Exportar resultado: UNION_2
write.csv(UNION_2, file = "UNION_2.csv")

# Exportar resultado: SEPARADO_1
write.csv(SEPARADO_1, file = "SEPARADO_1.csv")

# Exportar resultado: SEPARADO_2
write.csv(SEPARADO_2, file = "SEPARADO_2.csv")

# Exportar resultado: SEPARADO_3
write.csv(SEPARADO_3, file = "SEPARADO_3.csv")