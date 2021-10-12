# Hecho con gusto por Juan Antonio González Sierra

# Materia: Temas Selectos III Análisis de Datos

# Docente: Carla Carolina Pérez Hernández


#######################################
# 1. Instalar los siguientes paquetes #
#######################################
install.packages("visNetwork")
install.packages("htmlwidgets")
install.packages("igraph")
install.packages("reshape")
install.packages("Matrix")
install.packages("RSiena")
install.packages("networkD3")
install.packages("curl")
install.packages("devtools")
library(devtools)
devtools::install_github("PABalland/EconGeo", force = T)
install.packages("pheatmap")
install.packages("viridisLite")


########################
### 0. Llamar paquetes #
########################

# http://econ.geo.uu.nl/peeg/peeg1709.pdf
library (EconGeo)
library(pheatmap)
library(viridis)


################################################
# 2.A OBTENER HEATMAP DE LA MATRIZ RCA BINARIA #
################################################

file.choose()

heatmap_1 <- as.matrix(
  read.csv("C:\\Users\\jagon\\Desktop\\Doctorado\\4to semestre\\Modulo 2\\Laboratorios\\JAGS_LAB53 Heatmap\\JAGS_LAB53\\Inputs\\RCABIN.csv" ,
           sep = "," ,
           header = T,
           row.names = 1))

# Graficando con pheatmap!
h1=pheatmap(heatmap_1)
h1

# Cambiar color del heatmap
colorz <- c('white', 'navy blue')

# Se genera nuevo heatmap cpn colores identifcados en colorz
h2=pheatmap(heatmap_1, frontsize = 6, cluster_rows = T, cluster_cols = F, treeheight_row = 1, treeheight_col = 0, 
         main = "", fontsize = 12, annotation_legend = FALSE, display_numbers = FALSE, 
         fontsize_number = 6, col = colorz)
h2