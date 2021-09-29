#Hecho con gusto por Juan Antonio González Sierra (UAEH)
#V8
# LABORATORIO - Gráficos en R con ggplot2 para Ciencia de Datos
# Editando el color de los gráficos (PARTE 1)



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

#De donde sacar colores?
#http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf

#Escala discreta
#Haciendo grafica de puntos por continente
g1 <- ggplot(data = gapminder2007,
             mapping = aes(x = gdpPercap,
                           y = lifeExp,
                           color = continent)) +
  geom_point()


#Ver g1
g1


#Haciendo boxplot en continentes
g2 <- ggplot(data = gapminder2007,
             mapping = aes(x = continent, 
                           y = lifeExp,
                           fill = continent)) +
  geom_boxplot()


#Ver g2
g2


#Cambiando el color de los continentes

GR1 = g1 + scale_color_manual (values = c('cadetblue',
                                    'chartreuse',
                                    'firebrick',
                                    'gold',
                                    'darkorchid'))
GR1


#Notar que en grafico de cajas y bigotes es fill (rellenar) en vez de color
GR2= g2 + scale_fill_manual (values = c('cadetblue',
                                   'chartreuse',
                                   'firebrick',
                                   'gold',
                                   'darkorchid'))
GR2


#Cambiando colores con paleta RColorBrewer
#Instalar RColorBrewer

install.packages('RColorBrewer')


#Para ver las paletas

library(RColorBrewer)
display.brewer.all()

#Guardar como imagen width = 400, height = 800 (click en expor, export image, escoger opciones)


#Cambiando escala de color
GR3=g1 + scale_color_brewer(palette = "BrBG")
GR3

GR4=g2 + scale_fill_brewer(palette = "Paired")
GR4


#Cambiando escala de grises
GR5 = g1 + scale_color_grey()
GR5

GR6=g2 + scale_fill_grey()
GR6