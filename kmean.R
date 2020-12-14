df = read.csv('Mall_Customers.csv')

df = df[c(4, 5)]

info.1 = kmeans(df, centers = 1)
info.2 = kmeans(df, centers = 2)
info.3 = kmeans(df, centers = 3)
info.4 = kmeans(df, centers = 4)

# find optimal value for k

wss.data = vector()
for (k in 1:10) {
  # get the kmeans
  info = kmeans(df, k)
  
  # find the withins
  wss.data[k] = info$withinss
}

plot(1:10,wss.data)
info.4 = kmeans(df,centers = 4)

library(cluster)
clusplot(df,info4$cluster,color = TRUE,shade = TRUE)

