# Hecho con gusto por Juan Antonio González Sierra (UAEH)
# LABORATORIO - Graficas animadas con ggplot2


#################################################
# Objetivo: hacer graficas animadas con ggplot2
# ------------------------------------------------

# En este ejercicio vamos a:
# 1. grafica basica
# 2. animando grafica
# 3. mejorando animacion


#Cargando libreria tidyverse
library(tidyverse)

#Instalando paquete para animar
install.packages('gganimate')
library(gganimate)

install.packages('gifski')
library(gifski)

#Instalando paquete con los datos
install.packages("gapminder")

#Cargando paquete con los datos
library(gapminder)

#Cargando datos a entorno
data("gapminder")

#Cargando datos a entorno
head(gapminder)

################################
# 1.Grafica basica
################################
g_animada <- gapminder %>% 
  group_by(year, continent) %>% 
  summarize (mean_life = mean(lifeExp)) %>% 
  ggplot(aes (x = year, 
              y = mean_life,
              color = continent)) +
  geom_line()

g_animada


################################
# 2. Animando grafica
################################
g_animada + transition_reveal(year)