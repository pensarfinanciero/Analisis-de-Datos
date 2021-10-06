# Hecho con gusto por Juan Antonio González Sierra

# Materia: Temas Selectos III Análisis de Datos

# Docente: Carla Carolina Pérez Hernández


###############
# CORRELACIÓN #
###############


# install.packages("ggplot2")
# install.packages("ggcorrplot")
# install.packages("psych")
# install.packages("ggthemes")


# Se llaman a los paquetes
library(ggplot2)
library(ggcorrplot)
library(psych)
library(ggthemes)


# Se busca archivo con el que se va trabajar
file.choose()
Correl = read.csv("C:\\Users\\jagon\\Desktop\\Doctorado\\4to semestre\\Modulo 2\\Laboratorios\\JAGS_LAB52 Correlación Dataviz\\JAGS_LAB52\\Input\\para r final.csv")


# Se obtiene matriz de correlaciones
GC <- cor(Correl, method = "pearson")
GC


# Se redondea a 2 digitos el calculo de la correlación en la matriz
GC <- round(GC, digits=2)
GC


# Se realiza visualización de la matriz de correlación, se utiliza tema calc de la paqueteria ggthemes
GMC=ggcorrplot(GC, method = "circle", type="lower", lab = TRUE) +
  ggtitle("                             Matriz de correlación") +
  theme_calc()
GMC