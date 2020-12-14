df = read.csv('Social_Network_Ads.csv')

# step = 2
df = df[-1]
df$Gender = factor(df$Gender, levels = c('Male', 'Female'), labels = c(1, 2))

# step 3
library(caTools)
set.seed(12341234)
result = sample.split(df$Purchased, SplitRatio = 0.8)
df.train = df[result == T, ]
df.test = df[result == F, ]

# linear regression
classifier.lm = lm(formula = Purchased ~ ., data = df.train)
purchased.test.lm = predict(classifier.lm, newdata = df.test)
purchased.test.lm = ifelse(purchased.test.lm > 0.5, 1, 0)

cm.lm = table(df.test$Purchased, purchased.test.lm)
accuracy.lm = sum(diag(cm.lm)) / sum(cm.lm)
print(paste("Accuracy for linear regression is =", accuracy.lm * 100, "%"))


# logistic regression
classifier.glm = glm(formula = Purchased ~ ., data = df.train, family = 'binomial')
purchased.test.glm = predict(classifier.glm, newdata = df.test)
purchased.test.glm = ifelse(purchased.test.glm > 0.5, 1, 0)

cm.glm = table(df.test$Purchased, purchased.test.glm)
accuracy.glm = sum(diag(cm.glm)) / sum(cm.glm)
print(paste("Accuracy for logistic regression is =", accuracy.glm * 100, "%"))


# install.packages('class')
library(class)
purchased.knn = knn(train = df.train[-4], test = df.test[-4], cl = df.train$Purchased, k = 7)
print(purchased.knn)

cm.knn = table(df.test$Purchased, purchased.knn)
accuracy.knn = sum(diag(cm.knn)) / sum(cm.knn)
print(paste("Accuracy for KNNregression is =", accuracy.knn * 100, "%"))


