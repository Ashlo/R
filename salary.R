df = read_csv('/home/sunbeam/data1/Salary_Data.csv')


model = lm(formula = Salary ~ YearsExperience, data = df)
salaries = predict(model, newdata = data.frame(YearsExperience=c(14, 15, 16, 17, 18, 19, 20)))

library(tidyverse)

salary.hat = predict(model, newdata = data.frame(YearsExperience = df$YearsExperience))

ggplot() +
  geom_point(aes(x = df$YearsExperience, y = df$Salary, col='blue')) + 
  geom_line(aes(x = df$YearsExperience, y = salary.hat, col = 'red') )