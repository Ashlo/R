df = read.csv('Mall_Customers.csv')

#Step 2
df = df[c(4,5)]

k.means = function(){
  wss = vector()
  for(k in 1:10){
    info = kmeans(df,k,iter.max = 100)
    wss[k] = info$withinss
  }
plot(1:10,wss)
  
#optimal value of k 
k=4
info = kmeans(df,k,iter.max = 100)
library(cluster)
clusplot(df,info$cluster,shade = TRUE,color = TRUE)

}
#kmeans()


h.clust = function(){
  info = hclust(dist(df))
  plot(info)
}
h.clust()

