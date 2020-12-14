library(caTools)
library(class)
library(e1071)
library(rpart)
library(rpart.plot)
library(randomForest)
library(ggplot2)


df =read.csv("iris.csv")
head(df)


df$species= factor(df$species,levels = c("setosa","versicolor","virginica"),labels= c(1,2,3))
result = sample.split(df$species,SplitRatio = 0.8)
df.train = df[result == T,]
df.test = df[result == F,]

find_accuracy = function(observed,expected){
  cm = table(observed,expected)
  accuracy = sum(diag(cm)/sum(cm))
  return(accuracy * 100)
}


linear_regression = function(df.train,df.test){
  model = lm(formula = species~.,data = df.train)
  predictions = predict(model,newdata = df.test)
  predictions = ifelse(predictions > 0.5,1,0)
  return(predictions)
}


logistic_regression = function(df.train,df.test){
  model = glm(species~.,data = df.train)
  predictions = predict(model,newdata = df.test)
  predictions = ifelse(predictions> 0.5,1,0)
  return(predictions)
}

model.knn = function(df.train,df.test){
  predictions = knn(train = df.train[-5],test = df.test[-5],cl= df.train$species,k=5)
  return(predictions)
}
model.svm = function(df.train,df.test){
  model= svm(species ~.,data = df.train,type = "C-classfication")
  predictions = predict(model,newdata = df.test)
  
}
model.dt = function(df.train,df.test){
  model = rpart(species~.,data = df.train,method = 'class')
  predictions = predict(model,newdata = df.test,type = 'class')
  return (predictions)
}
model.rf= function(df.train,df.test){
  model = randomForest(species~.,data = df.train,ntree = 10)
  predictions = predict(model,newdata = df.test,type = 'class')
  return(predictions)
}

predictions.lm = linear_regression(df.train, df.test)
accuracy.lm = find_accuracy(df.test$species, predictions.lm)
print(paste("linear regression accuracy = ", accuracy.lm, "%"))

predictions.glm = logistic_regression(df.train, df.test)
accuracy.glm = find_accuracy(df.test$species, predictions.glm)
print(paste("logstic regression accuracy = ", accuracy.glm, "%"))

predictions.knn = model.knn(df.train, df.test)
accuracy.knn = find_accuracy(df.test$species, predictions.knn)
print(paste("knn accuracy = ", accuracy.knn, "%"))

predictions.svm = model.svm(df.train, df.test)
accuracy.svm = find_accuracy(df.test$species, predictions.svm)
print(paste("svm accuracy = ", accuracy.svm, "%"))

predictions.dt = model.dt(df.train, df.test)
accuracy.dt = find_accuracy(df.test$species, predictions.dt)
print(paste("decision tree accuracy = ", accuracy.dt, "%"))

predictions.rf = model.rf(df.train, df.test)
accuracy.rf = find_accuracy(df.test$species, predictions.rf)
print(paste("random forest accuracy = ", accuracy.rf, "%"))



