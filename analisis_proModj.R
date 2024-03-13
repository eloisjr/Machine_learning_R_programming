library(dplyr)
library(class)
library(caret)
library(kernlab)

trainingSet <- read.csv("Project/JSSP-Entrenamiento(2021).csv")
testSet <- read.csv("Project/JSSP-Prueba(2021).csv")

create.labels <- function(times) {
  methods <- c('T1', 'T2', 'T3')
  methods[which.min(times)]
}

classTraining <- select(trainingSet, T1, T2, T3) %>% apply(1, create.labels)
classTest <- select(testSet, T1, T2, T3) %>% apply(1, create.labels)
trainingSet <- select(trainingSet, -T1, -T2, -T3)
testSet <- select(testSet, -T1, -T2, -T3)

prediction <- knn(trainingSet, testSet, cl = classTraining, k = 3)
confusionmatrix<-table(actual = classTest, prediction)

evaluate <- function(m) {
  accuracy = 0
  for (i in 1:nrow(m)) {
    accuracy <- accuracy + m[i, i]
  }
  accuracy / sum(m)
}


accuracy <- evaluate(confusionmatrix)
accuracy

#Con m?todo KNN solo acerto un 0.01 el cual es un valor bajo y malo. 

trainingSet$classTraining <- classTraining
testSet$classTest <- classTest

#CLASIFICACION SVM
model <- ksvm(classTraining ~ ., data = trainingSet, kernel = 'polydot')
prediction <- predict(model, testSet, type = 'response')
matrix<-table(actual = testSet$classTest, prediction)
matrix
accuracy <- evaluate(matrix)
accuracy

#Con el metodo SVM se obtuvo un valor muy peque?o y es malo.Por lo que acerto a muy pocos o casi a nada. 

