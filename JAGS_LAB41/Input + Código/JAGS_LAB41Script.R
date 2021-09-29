#Hecho con gusto por Juan Antonio González Sierra (UAEH)
#V8
# LABORATORIO - Gráficos en R con ggplot2 para Ciencia de Datos
# Editando el color de los gráficos (PARTE 2)


#instalando paquete con los datos
#install.packages("gapminder")
#install.packages("ggplot2")



# cargar libreria ggplot2 y gapminder
library(ggplot2)
library(gapminder)

#Cargando datos a entorno
data("gapminder")


#Filtrando por año 2007
gapminder2007 <- gapminder[gapminder$year == '2007', ]


#Escala continua (variable continua)
#Haciendo grafica de puntos por poblacion
g3 <- ggplot(data = gapminder2007,
             mapping = aes(x = gdpPercap,
                           y = lifeExp,
                           color = log(pop))) +
  geom_point()


#Ver g3
g3

#Cambiando el color de los puntos según gradiente
G3.1 = g3 + scale_color_gradient(low = "blue" , high = "red")
G3.1


#Se utiliza gradiente 2
G3.2 = g3 + scale_color_gradient2(midpoint = 16, low = "blue", mid = "white",
                                  high = "red", space ="Lab")
G3.2

#Haciendo boxplot en poblacion
g4 <- ggplot(data = gapminder2007,
             mapping = aes(x = lifeExp,
                           fill = ..count..)) +
  geom_histogram()


#Ver g4
g4


#Cambiando color de barras histograma
G4.1 = g4 + scale_fill_gradient(low = "blue", high = "red")
G4.1