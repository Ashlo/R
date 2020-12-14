df = read.csv('Salary_Data.csv')
#checking na values
print(is.na(df$YearsExperience))
print(is.na(df$Salary))

library(caTools)

set.seed(12345678)
result = sample.split(df$Salary,SplitRatio = 0.8)
df.train = df[result == TRUE,]
df.test = df[result == FALSE,]


model = lm(Salary ~ YearsExperience,data= df.train)
salaries.test = predict(model,newdata = df.test)
print(salaries.test)

# Visualization
library(ggplot2)
df.train_expected = predict(model,newdata = df.train)
ggplot() +
  geom_point(aes(df.train$YearsExperience,df.train$Salary,color ='green'))
geom_line(aes(df.train$YearsExperience,df.train$Salary,color ='red'))

df.test_expected = predict(model,newdata = df.test)
ggplot() +
  geom_point(aes(df.test$YearsExperience,df.test$Salary,color ='green'))
geom_line(aes(df.test$YearsExperience,df.test$Salary,color ='red'))


#find Unknowm salaries 

