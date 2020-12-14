# step 1
df = read.csv('Wine.csv')

# step 2

# step 3
library(caTools)
set.seed(1234)
result = sample.split(df$Customer_Segment, SplitRatio = 0.8)
df.train = df[result == T, ]
df.test = df[result == F, ] 

# linear regression
classifier.lm = lm(formula = Customer_Segment ~ ., data = df.train)
segments = predict(classifier.lm, newdata = df.test)
segments = ifelse(segments <= 1, 1, ifelse(segments <= 2, 2, 3))

cm = table(df.test$Customer_Segment, segments)
accuracy = sum(diag(cm)) / sum(cm)
print(paste("accuracy of lm =", accuracy * 100, "%"))


# logistic regression
classifier.glm = glm(formula = Customer_Segment ~ ., data = df.train, family = 'binomial')
segments = predict(classifier.glm, newdata = df.test)
segments = ifelse(segments <= 1, 1, ifelse(segments <= 2, 2, 3))

cm = table(df.test$Customer_Segment, segments)
accuracy = sum(diag(cm)) / sum(cm)
print(paste("accuracy of glm =", accuracy * 100, "%"))

# knn
library(class)
segments = knn(train = df.train[-14], test = df.test[-14], cl = df.train$Customer_Segment, k = 7)
accuracy = sum(diag(cm)) / sum(cm)
print(paste("accuracy of KNN =", accuracy * 100, "%"))

