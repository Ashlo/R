#step1 collect the data

# cleansing data
  #-remove na values with mean median and mode
  #-make sure the data is using the correct data types
  #-convert the categorical values to numerical
#step 3 Build the model by using respective algprithm
#step4 : perform the requiered operation(prediction or clasification)
#step 5 : Evaluate Model by using model accuracy
#step 6 : Visulizating the output(using ggplot2)


age = c(20, 25, 30, 35, 40, 45, 50, 55, 60)
salary = c(20000, 30000, 34000, 45000, 50000, 60000, 80000, 100000, 120000)

#what will be the salary for an employee whose age is 65

df =data.frame(age =age,salary = salary)

#print(df)
#y ~ x
#simple linear regression
#y =mx + c 
#y = b1x1 + b0
model = lm(salary ~ age,data = df)
print(model)
# predict the salary of person with age of 65
salary.65 = predict(model,newdata = data.frame(age = 65))
print(salary.65)

# Visualize the data
library(tidyverse)


y.hat = predict(model, newdata = data.frame(df$age))

ggplot() +
  geom_point(aes(x = df$age, y = df$salary)) + 
  geom_line(aes(x = df$age, y = y.hat, color='red')) 

