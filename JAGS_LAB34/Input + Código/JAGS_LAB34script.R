# Hecho con gusto por Juan Antonio Gonz�lez Sierra (UAEH)
#v2
# LABORATORIO - Gr�ficos en R con ggplot2 para Ciencia de Datos
#Grafica de lineas en R 


#Se instalan los paquetes de gapminder y ggplot 2
install.packages("gapminder")
install.packages("ggplot2")


#Cargar libreria ggplot2 y gapminder
library(ggplot2)
library(gapminder)


#Cargando datos a entorno de R
data("gapminder")


#Filtrando ESPA�A
gapminderES = gapminder[gapminder$country == "Spain",]


#Como hacer gr�fica de linea con ggplot2
g1= ggplot(data = gapminderES,
       mapping = aes(x = year,
                     y = lifeExp)) +
  geom_line()
g1


#Como modificar tipo de linea y color
g2 = ggplot(data = gapminderES,
       mapping = aes(x = year,
                     y = lifeExp)) +
  geom_line(linetype = "dashed",
            color = "red")
g2


#Como modificar tama�o y hacer flecha
g3 = ggplot(data = gapminderES,
       mapping = aes(x = year,
                     y = lifeExp)) +
  geom_line(linetype = "dashed",
            color = "red",
            arrow = arrow(),
            size = 2) +
  geom_point (size = 3)
g3


#Como agregar puntos, en este caso se consideran pa�ses de habla hispana y seran agregados a R
#Se introducen como vector primero
hispam_vec = c(
  'Argentina', 'Brazil', 'Bolivia', 'Chile', 'Colombia',
  'Costa Rica', 'Cuba', 'Dominican Republic',
  'Ecuador', 'El Salvador', 'Guatemala', 'Honduras',
  'Mexico', 'Nicaragua', 'Panama', 'Paraguay',
  'Peru', 'Uruguay',
  'Spain', 'Puerto Rico',
  'Venezuela' )


#Posteriormente se genera el gapminder de paises de habla hispana y se crea un objeto en df
gapminder_hisp = gapminder [gapminder$country %in% hispam_vec,]


#Probando diferentes aestetics (colores por pa�s)
g4 = ggplot(data = gapminder_hisp,
       mapping = aes(x = year,
                     y = lifeExp,
                     color = country)) +
  geom_line()
g4


#Exportar dataframe de pa�ses hispanoparlantes en csv
write.csv(gapminder_hisp, file = "gapminder_hisp.csv")