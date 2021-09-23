Realizado con gusto por Juan Antonio González Sierra

install.packages("tidyverse")


#instalar paquete de datos

install.packages("remotes")
remotes::install_github("cienciadedatos/datos")
install.packages("datos")

library(data.table)
library(dplyr)

library(readr)
data2013 <- read_csv("greenR_2013.csv")
data2013 <- as.data.table(data2013)

class(data2013)

resultados2013 <- data2013 %>% 
  group_by(location_name) %>% 
  summarise(suma_GCI_2013 = sum(GCI_2013, na.rm = TRUE),
            suma_GP_SINVCR = sum(GP_SINVCR, na.rm = TRUE),
            suma_GCP_2013 = sum(GCP_2013, na.rm = TRUE),
            count = n())

#exportar archivo generado
write.csv(resultados2013, file = "resultados2013.csv")