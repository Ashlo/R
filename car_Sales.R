getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
df = read_csv("/home/sunbeam/data1/Cars_sales.csv")

# clean the data
#replace the na values
make.mode = getmode(df$Make)
odometer.mean = mean(df$`Odometer (KM)`, na.rm = T)
df$`Odometer (KM)` = ifelse(is.na(df$`Odometer (KM)`), odometer.mean, df$`Odometer (KM)`)
df$Make = ifelse(is.na(df$Make), make.mode, df$Make)

df$kms = df$'Odometer (KM)'

#remove unneccesary values
df$Colour = NULL
df$Doors = NULL
df$`Odometer (KM)` = NULL

# step 3
model = lm(formula = Price ~ kms + Make,data= df)
df.new = data.frame(kms = c(13000),Make = 'Honda')
price = predict(model, newdata = df.new)
print(price)
