# Hecho con gusto por Juan Antonio Gonz�lez Sierra

# Estudiante del Doctorado en Ciencias Econ�mico Administrativas de la UAEH

# Materia: Temas Selectos III An�lisis de Datos

# Docente: Carla Carolina P�rez Hern�ndez


###############
### ECONGEO ###
###############

# Para este trabajo se desarrollan los ejemplos del manual de ECONGEO de Balland (2017), siendo los correspondientes a:

# 1.Curva de hoover

# 2.Gini

# 3.Curva de Hoover (se indaga un poco mas los resultados)

# 4.locational.Gini

# 5.locational.Gini.curve

# 6.lorenz.curve

# Recuerda que se debe instalar lo referente a ECONGEO y llamarla para poder trabajar con ella
library (EconGeo)

###############################################
# 1. Ejemplo 4. Graficando la curva de Hoover #
###############################################

# Con esta funci�n se puede graficar la curva de Hoover de las matrices regiones - industrias acorde a Hoover (1936)

## Genera vectores industriales y de poblaci�n
ind <- c(0, 10, 10, 30, 50)
pop <- c(10, 15, 20, 25, 30)

# revisa el vector llamado "ind"
ind

# revisa el vector llamado "pop"
pop

## Corre la funci�n (30% de la poblaci�n produce el 50% de los entregables de la industria)
Hoover.curve(ind, pop)

# computa el calcucolo correspondiente a Hoover Gini (�ndice de Gini)
Hoover.Gini(ind, pop)


###########
# 2. Gini #
###########

## Con esta funci�n se computa el coeficiente de Gini, que mide la desigualdad espacial. Su tango de valor comprende de 0 (igualdad perfecta en los ingresos) a 1 (Desigualdad perfecta en los ingresos) que se deriva de la curva de Lorenz.

## genera los siguientes vectores correspondiente a datos de la industria
indg <- c(0, 10, 10, 30, 50)

## corre la funci�n de Gini
Gini(indg)

## genera la matriz regi�n - industria
mat = matrix (
c (0, 1, 0, 0,
0, 1, 0, 0,
0, 1, 0, 0,
0, 1, 0, 1,
0, 1, 1, 1), ncol = 4, byrow = T)
rownames(mat) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat) <- c ("I1", "I2", "I3", "I4")

## corre la funci�n de Gini
Gini (mat)

## corre la funci�n pero en este caso se agregan todas las industrias
Gini (rowSums(mat))

## corre la funci�n �nicamente para la industria 1 (denota igualdad perfecta)
Gini (mat[,1])

## corre la funci�n �nicamente para la industria 2 (denota igualdad perfecta)
Gini (mat[,2])

## corre la funci�n �nicamente para la industria 3 (denota desigualdad perfecta: Gini m�ximo = (5-1)/5)
Gini (mat[,3])

## corre la funci�n �nicamente para la industria 3 (el top 40% produce el 100% de los entregables industriales)
Gini (mat[,4])


###################
# 3. Hoover.curve #
###################

## Con esta funci�n se grafica la curva de Hoover de las matrices regiones-industrias

## Genera vectores industriales y de poblaci�n (son los mismos generados en el apartado 1 de este cuaderno que hace referencia al ejemplo 4)
ind <- c(0, 10, 10, 30, 50)
pop <- c(10, 15, 20, 25, 30)

## Corre la funci�n (30% de la poblaci�n produce el 50% de los entregables de la industria)
Hoover.curve(ind, pop)

# Para guardar en tu directorio como PDF
Hoover.curve(ind, pop, pdf = TRUE)
Hoover.curve(ind, pop, plot = F)

## genera una matriz regi�n - industria
mat1 = matrix (
c (0, 10, 0, 0,
0, 15, 0, 0,
0, 20, 0, 0,
0, 25, 0, 1,
0, 30, 1, 1), ncol = 4, byrow = T)
rownames(mat1) <- c("R1", "R2", "R3", "R4", "R5")
colnames(mat1) <- c ("I1", "I2", "I3", "I4")

## corre las funciones
Hoover.curve(mat1, pop)
Hoover.curve(mat1, pop, pdf = TRUE)
Hoover.curve(mat1, pop, plot = FALSE)

## corre la funci�n pero en este caso se agregan todas las industrias
Hoover.curve(rowSums(mat1), pop)
Hoover.curve(rowSums(mat1), pop, pdf = TRUE)
Hoover.curve(rowSums(mat1), pop, plot = FALSE)

## corre la funci�n �nicamente para la industria 1
Hoover.curve(mat1[,1], pop)
Hoover.curve(mat1[,1], pop, pdf = TRUE)
Hoover.curve(mat1[,1], pop, plot = FALSE)

## corre la funci�n �nicamente para la industria 2 (perfectamente proporcional a la poblaci�n)
Hoover.curve(mat1[,2], pop)
Hoover.curve(mat1[,2], pop, pdf = TRUE)
Hoover.curve(mat1[,2], pop, plot = FALSE)

## corre la funci�n �nicamente para la industria 3 (30% de la poblaci�n produce el 100% de los entregables)
Hoover.curve(mat1[,3], pop)
Hoover.curve(mat1[,3], pop, pdf = TRUE)
Hoover.curve(mat1[,3], pop, plot = FALSE)

## corre la funci�n �nicamente para la industria 4 (55% de la poblaci�n produce el 100% de los entregables)
Hoover.curve(mat1[,4], pop)
Hoover.curve(mat1[,4], pop, pdf = TRUE)
Hoover.curve(mat1[,4], pop, plot = FALSE)

## Compara la distribuci�n en las industrias
par(mfrow=c(2,2))
Hoover.curve(mat1[,1], pop)
Hoover.curve(mat1[,2], pop)
Hoover.curve(mat1[,3], pop)
Hoover.curve(mat1[,4], pop)


######################
# 4. locational.Gini #
######################

## Con esta funci�n se computa el coeficiente de Gini ubicacional propuesto por Krugman para medir la concentraci�n de las matrices regiones - industrias.

## Entre m�s grande es el coeficiente teniendo como limite teor�tico 0.5, es mejor la concentraci�n industrial, y ser�a de 0 cuando existe dispersi�n

## Genera la matriz regi�n - industria
mat2 = matrix (
c (100, 0, 0, 0, 0,
0, 15, 5, 70, 10,
0, 20, 10, 20, 50,
0, 25, 30, 5, 40,
0, 40, 55, 5, 0), ncol = 5, byrow = T)
rownames(mat2) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat2) <- c ("I1", "I2", "I3", "I4", "I5")

## corre la funci�n
locational.Gini (mat2)


############################
# 5. locational.Gini.curve #
############################

## Con esta funci�n se grafica la curva de Gini ubicacional siguiendeo as matrices regiones - industrias de Krugman

## Genera la matriz regi�n - industria
mat3 = matrix (
  c (100, 0, 0, 0, 0,
     0, 15, 5, 70, 10,
     0, 20, 10, 20, 50,
     0, 25, 30, 5, 40,
     0, 40, 55, 5, 0), ncol = 5, byrow = T)
rownames(mat3) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat3) <- c ("I1", "I2", "I3", "I4", "I5")

## corre la funci�n (muestra a la industria No. 5)
locational.Gini.curve (mat3)
locational.Gini.curve (mat3, pdf = TRUE)


###################
# 6. lorenz.curve #
###################

## Con esta funci�n de grafica la curva de Lorenz de industrias regionales.

## genera los vectores de la industria
indlc <- c(0, 10, 10, 30, 50)

## corre la funci�n
Lorenz.curve (indlc)
Lorenz.curve (indlc, pdf = TRUE)
Lorenz.curve (indlc, plot = FALSE)

## genera la matriz regi�n - industria
mat4 = matrix (
  c (0, 1, 0, 0,
     0, 1, 0, 0,
     0, 1, 0, 0,
     0, 1, 0, 1,
     0, 1, 1, 1), ncol = 4, byrow = T)
rownames(mat4) <- c ("R1", "R2", "R3", "R4", "R5")
colnames(mat4) <- c ("I1", "I2", "I3", "I4")

## corre la funci�n de la curva de Lorenz
Lorenz.curve (mat4)
Lorenz.curve (mat4, pdf = TRUE)
Lorenz.curve (mat4, plot = FALSE)

## corre la funci�n pero en este caso se agregan todas las industrias
Lorenz.curve (rowSums(mat4))
Lorenz.curve (rowSums(mat4), pdf = TRUE)
Lorenz.curve (rowSums(mat4), plot = FALSE)

## corre la funci�n �nicamente para la industria 1 (denota igualdad perfecta)
Lorenz.curve (mat4[,1])
Lorenz.curve (mat4[,1], pdf = TRUE)
Lorenz.curve (mat4[,1], plot = FALSE)

## corre la funci�n �nicamente para la industria 2 (denota igualdad perfecta)
Lorenz.curve (mat4[,2])
Lorenz.curve (mat4[,2], pdf = TRUE)
Lorenz.curve (mat4[,2], plot = FALSE)

## corre la funci�n �nicamente para la industria 3 (denota desigualdad perfecta)
Lorenz.curve (mat4[,3])
Lorenz.curve (mat4[,3], pdf = TRUE)
Lorenz.curve (mat4[,3], plot = FALSE)

## corre la funci�n �nicamente para la industria 3 (el top 40% produce el 100% de los entregables industriales)
Lorenz.curve (mat4[,4])
Lorenz.curve (mat4[,4], pdf = TRUE)
Lorenz.curve (mat4[,4], plot = FALSE)

## compara la distribuci�n de las industrias
par(mfrow=c(2,2))
Lorenz.curve(mat4[,1])
Lorenz.curve(mat4[,2])
Lorenz.curve(mat4[,3])
Lorenz.curve(mat4[,4])