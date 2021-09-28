# Hecho con gusto por Juan Antonio Gonzalez Sierra (UAEH)

# LABORATORIO - Gr·ficos en R con ggplot2 para Ciencia de Datos
#Grafica de puntos en R (PARTE 1)


#instalando paquete con los datos
#install.packages("gapminder")

# cargando paquete con los datos
library(gapminder)

# cargando datos a entorno
data("gapminder")

# filtrando por a√±o 2007
gapminder2007 <- gapminder[gapminder$year == '2007', ]


# cargar libreria ggplot2
library(ggplot2)


# como hacer grafica de puntos con ggplot2
g1 = ggplot(data = gapminder2007,
       mapping = aes (x = gdpPercap,
                      y = lifeExp)) + 
  geom_point()
g1

# probando diferentes colores
g2 = ggplot(data = gapminder2007,
       mapping = aes (x = gdpPercap,
                      y = lifeExp,
                      color = continent)) + 
  geom_point()
g2
#probando diferentes estÈticas
g3 = ggplot(data = gapminder2007,
       mapping = aes (x = gdpPercap,
                      y = lifeExp,
                      color = continent,
                      shape = continent,
                      size = pop)) + 
  geom_point()
g3
#Colocando texto
g4 = ggplot(data = gapminder2007,
       mapping = aes (x = gdpPercap,
                      y = lifeExp,
                      color = continent,
                      shape = continent,
                      size = pop)) + 
  geom_point() +
  geom_text(label = gapminder2007$country,
            color = "black" ,
            size = 3)
g4

#Colocando lineas de regresiÛn acorde a los paÌses que conforman cada continente
g5 = ggplot(data = gapminder2007,
       mapping = aes (x = gdpPercap,
                      y = lifeExp,
                      color = continent)) + 
  geom_point() +
  geom_smooth(method = lm)
g5

#Eliminar desviaciÛn estandar con respecto a la media, eliminar ciertos elementos del grafo
g6 = ggplot(data = gapminder2007,
       mapping = aes (x = gdpPercap,
                      y = lifeExp,
                      color = continent)) + 
  geom_point() +
  geom_smooth (method = lm,
              se = FALSE,
              fullrange = TRUE)
g6