x = c(151,167,123,145,134,123,123,353,344,321)
y = c(67,46,58,69,70,70,67,79,46,65)

relation = lm(y~x)
print(relation)

print(summary(relation))

a = data.frame(x=152)
result = predict(relation,a)
print(result)


plot(y,x,col = "blue",main = "Height & Weight Regression",
     abline(lm(x~y)),cex = 1.3,pch = 16,xlab = "Weight in Kg",ylab = "Height in cm")