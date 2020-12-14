df = read.csv('Social_Network_Ads.csv')
df$User.ID = NULL

# no na values

# convert textual into numeric valies

df$Gender = as.factor(df$Gender,levels=c('Male','Female'),labels= c(1,2))

library(caTools)
result = sample.split(df$Purchased,SplitRatio = 0.8)
df.train = df[result == T,]

df.test = df[result == F,]
model = lm(Purchased ~.,data = df.train)
purchsed_test = predict(model,newdata = df.test)


