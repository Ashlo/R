library(arules)

transactions = read.transactions('Market_Basket_Optimisation.csv', rm.duplicates = T, sep = ',')
itemFrequencyPlot(transactions, topN = 10)
rules = apriori(transactions, parameter = list(confidence = 0.5, support = 0.1))
summary(rules)
inspect(rules)