# Hecho con gusto por Juan Antonio González Sierra (UAEH)
#V5
# LABORATORIO - Gráficos en R con ggplot2 para Ciencia de Datos
# Boxplot en R (diagrama de cajas y bigotes)



#Se deben instalar los siguientes paquetes
#install.packages("gapminder")
#install.packages("ggplot2")


#Cargar libreria ggplot2 y gapminder
library(ggplot2)
library(gapminder)


#Cargar datos a entorno de R
data("gapminder")


#Filtrando por año 2007
gapminder2007 <- gapminder[gapminder$year == '2007', ]


#boxplot en ggplot2
g1=ggplot(data=gapminder2007,
       mapping = aes(y = lifeExp)) + 
  geom_boxplot()
g1


#boxplot varias variables ggplot2 (comparar, en este caso por continente)
g2=ggplot(data=gapminder2007,
       mapping = aes(x = continent,
         y = lifeExp)) + 
  geom_boxplot()
g2


#Marcando datos atipicos (elemento estético)
g3=ggplot(data=gapminder2007,
       mapping = aes(x = continent,
                     y = lifeExp)) + 
  geom_boxplot(outlier.colour="red",
               outlier.shape = 8,
               outlier.size = 4)
g3


#Marcando datos atipicos (vertical)
g4=ggplot(data=gapminder2007,
       mapping = aes(x = continent,
                     y = lifeExp)) + 
  geom_boxplot(outlier.colour="red",
               outlier.shape = 8,
               outlier.size = 4) +
  coord_flip()
g4


#Marcando datos atipicos y observaciones por continente
g5=ggplot(data=gapminder2007,
       mapping = aes(x = continent,
                     y = lifeExp)) +
  geom_boxplot() +
  geom_jitter(shape = 16,
              position = position_jitter(0.2))
g5


#Cambiando color de cajas
g6=ggplot(data=gapminder2007,
       mapping = aes(x = continent,
                     y = lifeExp,
                     fill = continent)) +
  geom_boxplot()
g6