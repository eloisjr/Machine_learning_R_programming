# Carga las librerías necesarias
library(dplyr)

# Lee los datos
data <- read.csv('JSSP-Entrenamiento(2021).csv')

# Compara estadísticamente los pares de Ts
t.test(data$T1, data$T2) # p-value = 0.0001295, se rechaza la hipótesis de que T1 y T2 son iguales (con 5% de significancia)
t.test(data$T1, data$T3) # p-value = 3.339e-07, se rechaza la hipótesis de que T1 y T2 son iguales (con 5% de significancia)
t.test(data$T2, data$T3) # p-value < 2.2e-16, se rechaza la hipótesis de que T1 y T2 son iguales (con 5% de significancia)

# Complementamos el análisis con un boxplot
boxplot(data$T1, data$T2, data$T3, notch = TRUE) 
# Definitivamente, T3 no es una buena opción si consideramos el comportamiento promedio.
# Sin embargo, hay casos aislados donde T3 es claramente la mejor opción.

# Se define una función que crea las etiquetas dados tres valores de tiempo
create.labels <- function(times) {
  methods <- c('T1', 'T2', 'T3')
  methods[which.min(times)]
}

# Se aplica la función a cada fila de los datos
# La columna con las etiquetas se agregan al data frame (sobreescribe la variable)
data$BEST <- select(data, T1, T2, T3) %>% apply(1, create.labels)

# Si vas a realizar clasificación, es necesario remover los valores de T1, T2 y T3, ya que no los tendrás en la práctica
data <- select(data, -T1, -T2, -T3)

# Visualiza los primeros cinco renglones del data frame modificado
head(data, 5)

# Muestra cuántas veces cada método es la mejor opción
table(data$BEST)

# Guarda el data frame modificado en un archivo csv
write.csv(data, 'JSSP-Entrenamiento(2021)-Proc.csv', row.names = FALSE)
