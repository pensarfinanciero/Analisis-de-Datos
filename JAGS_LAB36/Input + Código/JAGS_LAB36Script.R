# Hecho con gusto por Juan Antonio González Sierra (UAEH)
#V4
# LABORATORIO - Gráficos en R con ggplot2 para Ciencia de Datos
# Histogramas en R



#instalando paquete con los datos
#install.packages("gapminder")
#install.packages("ggplot2")
# Grafica de lineas en R


# cargar libreria ggplot2 y gapminder
library(ggplot2)
library(gapminder)


# cargando datos a entorno
data("gapminder")


# filtrando por año 2007
gapminder2007 <- gapminder[gapminder$year == '2007', ]


# hacer un histograma en ggplot2
g1=ggplot(data = gapminder2007,
       mapping = aes(x=lifeExp)) +
  geom_histogram()
g1


# hacer un histograma en ggplot2 con 9 intervalos (bins)
g2=ggplot(data = gapminder2007,
       mapping = aes(x=lifeExp)) +
  geom_histogram(bins = 9)
g2


# haciendo más cosas interesantes (colorear por continente)
g3=ggplot(data = gapminder2007,
       mapping = aes(x=lifeExp,
                     fill = factor(continent))) +
  geom_histogram(bins = 9)
g3