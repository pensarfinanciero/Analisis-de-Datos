#Hecho con gusto por Juan Antonio González Sierra (UAEH)
#V9
#LABORATORIO - Gráficos en R con ggplot2 para Ciencia de Datos
#editar con temas de ggplot2



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


#Haciendo grafica de puntos
p1 <- ggplot(data = gapminder2007,
             mapping = aes(x = gdpPercap,
                           y = lifeExp,
                           color = continent)) +
  geom_point()
p1


#Temas básicos
g1 = p1 + theme_bw()
g1

g2 = p1 + theme_minimal()
g2


#Mas temas, instalar este paquete
install.packages('ggthemes')


#Llamar al paquete
library(ggthemes)


#Temas y colores
g3=p1 + theme_economist() + scale_color_economist()
g3

g4=p1 + theme_excel_new() + scale_color_excel_new()
g4

#fivethirtyeight solo soporta 3 colores (3 valores máximo)
g5=p1 + theme_fivethirtyeight() + scale_color_fivethirtyeight()
g5

g6=p1 + theme_gdocs() + scale_color_gdocs()
g6

g7=p1 + theme_grey() + scale_color_grey()
g7

g8=p1 + theme_hc() + scale_color_hc()
g8

g9=p1 + theme_pander() + scale_color_pander()
g9

g10=p1 + theme_solarized() + scale_color_solarized()
g10

g11=p1 + theme_stata() + scale_color_stata()
g11

g12=p1 + theme_wsj() + scale_color_wsj()
g12

g13=p1 + theme_pander() + scale_color_solarized()
g13

g14=p1 + theme_dark() + scale_color_brewer()
g14

g15=p1 + theme_light() + scale_color_calc()
g15

#CANVA ACEPTA MAXIMO 4 VALORES
g16=p1 + theme_economist_white() + scale_color_canva()
g16

g17=p1 + theme_test() + scale_color_hue()
g17

g18=p1 + theme_clean() + scale_color_excel_new()
g18

#fivethirtyeight soporta solo 3 colores
g19=p1 + theme_bw() + scale_color_fivethirtyeight()
g19

g20=p1 + theme_stata() + scale_color_tableau()
g20

g21=p1 + theme_tufte()
g21

g22=p1 + theme_foundation()
g22

g23=p1 + theme_get()
g23

g24=p1 + theme_void()
g24

g25=p1 + theme_update()
g25

g26=p1 + theme_calc()
g26

g27=p1 + theme_par()
g27

g28=p1 + theme_linedraw()
g28