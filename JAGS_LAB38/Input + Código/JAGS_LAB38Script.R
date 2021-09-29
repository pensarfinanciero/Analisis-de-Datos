#Hecho con gusto por Juan Antonio González Sierra
#V6
#LABORATORIO - Gráficos en R con ggplot2 para Ciencia de Datos
#Manipular leyendas



#Instalando paquete con los datos
#install.packages("gapminder")
#install.packages("ggplot2")



#Cargar libreria ggplot2 y gapminder
library(ggplot2)
library(gapminder)


#Cargando datos a entorno
data("gapminder")


#Filtrando por año 2007
gapminder2007 <- gapminder[gapminder$year == '2007', ]


#Colocando texto base, se le otroga nombre de "p" en el entorno
p <- ggplot(data = gapminder2007,
            mapping = aes(x=gdpPercap,
                          y=lifeExp,
                          color = continent)) +
  geom_point()


#Mostrar la grafica
p


#Quitar titulo de la leyenda (se elimina palabra continent arriba de los colores de los continentes)
g1=p + theme(legend.title = element_blank())
g1


#Quitar toda la leyenda (nobres continentes)
g2=p + theme(legend.position = "none")
g2

#Cambiar la leyenda de posición
#Opciones: # rigth, left, bottom, top
g3=p + theme(legend.position = "top")
g3

#Cambiar con coordenadas de 0 a 1 (en medio entre X y Y)
g4=p + theme(legend.position = c(0.5, 0.5))
g4


#Cambiar con coordenadas de 0 a 1 (esquina inferior derecha)
g5=p + theme(legend.position = c(0.8, 0.3))
g5