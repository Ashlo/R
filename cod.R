# load required libraries
library(caTools)
library(class)

# function definitions

clean.data = function(df) {
  df = df[-1]
  df$Gender = factor(df$Gender, levels = c('Male', 'Female'), labels = c(1, 2))
  return(df)
}

load.data = function() {
  # load the data
  df = read.csv('Social_Network_Ads.csv')
  
  # clean the data
  df = clean.data(df)
  
  return(df)
}

split.data = function(df) {
  set.seed(12345)
  result = sample.split(df$Purchased, SplitRatio = 0.8)
  return (result)
}

classify.lm = function(df) {
  model = lm(formula = Purchased ~ ., data = df)
  return (model)
}

predict.values = function(model, df) {
  predictions = predict(model, newdata = df)
  return (predictions)
}

evaluate = function(expected, observed) {
  cm = table(observed, expected)
  accuracy = sum(diag(cm)) / sum(cm)
  return (accuracy * 100)
}

# function calls
df = load.data()
result = split.data(df)
df.train = df[result == T, ]
df.test = df[result == F, ]

model.lm = classify.lm(df.train)
predictions.lm = predict.values(model.lm, df.test)
predictions.lm = ifelse(predictions.lm >= 0.5, 1, 0)
accuracy.lm = evaluate(predictions.lm, df.test$Purchased)
print(accuracy.lm)

