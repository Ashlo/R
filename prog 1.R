#Create a vector

# Vector
apple = c('red','green','yellow')
print(apple)

#List

list1 = list(c(1,2,3),2,3,4)
print(list1)


#Matrices

M = matrix(c('a','b','c','d'), nrow =2,ncol = 2)
print(M)

m3 = matrix(c(1,2,3,4,5,2,2,3),nrow = 4,ncol = 2)
print(m3)


# arrays


a = array(c('green','yellow'),dim = c(3,3,2))
print(a)


# Factors


apple_colors = c('red','green','red','yellow','lime','red','lime')
factor_apple = factor(apple_colors)
print(factor_apple)
print(nlevels(factor_apple))

# Data frame


BMI = data.frame(
  gender = c("Male","Female","Male"),
  height = c(152,181.5,165),
  weight = c(81,94,78),
  Age = c(42,38,26)
)
print(BMI)

# cat

var_a = 12
var_b =5.5
var_c = "hello"

cat("the type of a is ",class(var_a))
cat("the type of b is ",class(var_b))
cat("the type of c is ",class(var_c))


# ifelse

set.seed(123)
mydata = data.frame(x1 = seq(1,20, by=2),
                    x2 = sample(100:200,10,FALSE),
                    x3 = LETTERS[1:10])
print(mydata)


mydata$x4 = ifelse(mydata$x2>150,1,0)
print(mydata)

numbers = c(10,20,30,40,50,60,70,80,90,100)
print(numbers[c(-1,0)])

y= 0.:5
vector(y)
y[3]

