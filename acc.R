df = read.csv("Social_Network_Ads.csv")

df = df[-1]
print(df)

head(df)

df$Gender = factor(df$Gender,levels = c("Male","Female"),labels = c(1,2))

library(caTools)
df
set.seed(123456789)
result = sample.split(df$Purchased,SplitRatio = 0.8)
df.train = df[result == T,]
df.test = df[result == F,]
model = lm(Purchased ~ ., data = df.train)
purchased.test = predict(model,newdata = df.test)

purchased.test = ifelse(purchased.test >=0.5,1,0)
 # step 5 
# Evaluate the model

confusion.matrix = table(df.test$Purchased,purchased.test)
print(confusion.matrix) 

accurate.classification = sum(diag(confusion.matrix))
total.classification = sum(confusion.matrix)
accuracy =  accurate.classification/total.classification
print(paste("accuracy of linear regression is ",accuracy * 100))
