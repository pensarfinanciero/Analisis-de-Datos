# Hecho con gusto por Juan Antonio González Sierra (UAEH)
#V3
# LABORATORIO - Gráficos en R con ggplot2 para Ciencia de Datos
# Graficas de barras en R 



#Se deben instalar los siguientes paquetes
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


# grafica de barras
g1=ggplot(data = gapminder2007,
       mapping = aes(x = factor(continent))) +
  geom_bar()
g1


# grafica de barras (VERTICAL)
g2=ggplot(data = gapminder2007,
       mapping = aes(x = factor(continent))) +
  geom_bar() +
  coord_flip()
g2


# creando etiqueta para expectativa de vida (en los gráficos subsecuentes se aplicará la etiqueta)
gapminder2007$lifeExp_label <- ifelse(
  gapminder2007$lifeExp < 50 ,
  "poca", 
  ifelse(gapminder2007$lifeExp < 70,
         "media",
         "alta"))


# guardando grafica en variable (se incluye en el entorno bajo el nombre de "p")
p <- ggplot(data = gapminder2007,
            mapping = aes(x = factor(continent),
                          fill = lifeExp_label))
  

# stacked bar chart (barras apiladas)
g3=p + geom_bar(position = "stack" , stat="count")
g3


# dogde bar chart (barras separadas)
g4=p + geom_bar(position = "dodge" , stat="count")
g4


# LLENA 100% + percent barchart
g5=p + geom_bar(position = "fill" , stat="count")
g5