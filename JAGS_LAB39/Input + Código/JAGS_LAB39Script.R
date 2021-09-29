#Hecho con gusto por Juan Antonio González Sierra (UAEH)
#V7
#LABORATORIO - Gráficos en R con ggplot2 para Ciencia de Datos
#faceting (romper un gráfica en varias dentro de una cuadrícula)



#instalando paquete con los datos
#install.packages("gapminder")
#install.packages("ggplot2")



#Cargar libreria ggplot2 y gapminder
library(ggplot2)
library(gapminder)


#Cargando datos a entorno
data("gapminder")


#Filtrando por año 2007
gapminder2007 <- gapminder[gapminder$year == '2007', ]


#Colocando grafica base
p <- ggplot(data = gapminder2007,
       mapping = aes (x = gdpPercap,
                      y = lifeExp,
                      color = continent)) +
  geom_point()


#Crear objeto p
p


#Facet_wrap (recomendado con una variable)
g1= p + facet_wrap(~ continent)
g1

#Manipulando número de filas
g2=p + facet_wrap(~ continent, nrow = 1)
g2


#Manipulando número de columnas
g3=p + facet_wrap(~ continent, ncol = 2)
g3


#Facet con dos variables
#Creando data para 2002 y 2007
gapminder02_07 <- gapminder[gapminder$year %in% c("2002","2007"), ]


#Creando grafica base "G2"
G2 <- ggplot(data = gapminder02_07,
            mapping = aes (x = gdpPercap,
                           y = lifeExp,
                           color = continent)) +
  geom_point()
G2

#Esperanza de vida por continente y año (forma 1)
g4 = G2 + facet_grid(continent ~ year)
g4


#Esperanza de vida por continente y año (forma 2)
g5 = G2 + facet_grid(year ~ continent)
g5