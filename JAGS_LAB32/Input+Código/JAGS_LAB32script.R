install.packages("tidyverse")
install.packages("remotes")
remotes::install_github("cienciadedatos/datos")
install.packages("datos")

library(data.table)
library(readr)

green.products <- read_csv("C:/Users/jagon/Desktop/Doctorado/4to semestre/Modulo 2/Laboratorios/JAGS_LAB32/green products.csv")
all.products <- read_csv("C:/Users/jagon/Desktop/Doctorado/4to semestre/Modulo 2/Laboratorios/JAGS_LAB32/COMPLETE_YEARS_PRODUCTS.csv")

green.products <- as.data.table(green.products)
all.products <- as.data.table(all.products)

#merge

merge.allproducts = merge(all.products, green.products, by="product_name_es")

#Decirle que una todo, ya que en el anterior se unen elementos que son compatibles. En este caso
#es unir pero que tome en cuenta todo y maneje como dato nulo auqellos que no se identifiquen
merge.full = merge(all.products, green.products, by="product_name_es", all.x = T)

write.csv(merge.full, file="merge.full.csv")