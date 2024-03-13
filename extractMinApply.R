# Carga las librerías necesarias.
library(dplyr)

# Lee los datos.
data <- read.csv('JSSP-Entrenamiento(2021).csv')

# Se define una función que selecciona el mínimo de los tiempos.
minTime <- function(times) {
  min(times)
}

# Se aplica la función a cada fila de los datos.
data$BEST <- select(data, T1, T2, T3) %>% apply(1, minTime)

# Guarda el data frame modificado en un archivo csv
write.csv(data, 'JSSP-Entrenamiento(2021)-Min.csv', row.names = FALSE)