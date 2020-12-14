ibrary(caTools)
library(randomForest)
library(ggplot2)

# step 1
df = read.csv('Social_Network_Ads.csv')

# step 2
df = df[-1]
df$Gender = factor(df$Gender, levels = c('Male', 'Female'), labels = c(1, 2))
df$Purchased = factor(df$Purchased)

# step 3
set.seed(12345)
result = sample.split(df$Purchased, SplitRatio = 0.8)
df.train = df[result == T, ]
df.test = df[result == F, ]


model = randomForest(formula = Purchased ~ ., data = df.train, ntree = 100)
predictions = predict(model, newdata = df.test)

# step 4
cm = table(df.test$Purchased, predictions)
accuracy = sum(diag(cm)) / sum(cm)
print(paste0("Random Forest accuracy = ", accuracy * 100, "%"))

# step 6
visualize = function(x, y, expected) {
  ggplot() +
    geom_point(
      aes(
        x = x, 
        y = y),
      col = ifelse(expected == 1, 'blue', 'red'),
      show.legend = FALSE) +
    ylab('Estimated Salary') +
    xlab('Age')
}


visualize(df.train$Age, df.train$EstimatedSalary, df.train$Purchased)

predictions.train = predict(model, newdata = df.train)
visualize(df.train$Age, df.train$EstimatedSalary, predictions.train)

visualize(df.test$Age, df.test$EstimatedSalary, df.test$Purchased)
visualize(df.test$Age, df.test$EstimatedSalary, predictions)