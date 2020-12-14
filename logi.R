df = read.csv("Social_Network_Ads.csv")

df = df[-1]
head(df)

df$Gender = factor(df$Gender,levels = c("Male","Female"),labels = c(1,2))
library(caTools)
result = sample.split(df$Purchased,SplitRatio = 0.8)
df.train = df[result == T,]
df.test = df[result == F,]
model = glm(Purchased ~ .,family = 'binomial',data = df.train)
print(model)


purchased.test = predict(model,newdata = df.test)
print(purchased.test)
purchased.test = ifelse(purchased.test > 0.5,1,0)
confusion.matrix = table(df.test$Purchased,purchased.test)

accurate.classification = sum(diag(confusion.matrix))
total.classification = sum(confusion.matrix)
accuracy =  accurate.classification/total.classification
print(paste("accuracy of logistic regression is ",accuracy * 100))