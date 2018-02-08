library(MASS)

# freeny dataset, available in R data()
# freeny is a data frame with variables y, lag.quarterly.revenue, price.index, income.level, and market.potential 
dataset = freeny

# Create matrix X
v0 = c(rep(1,39))
v1 = c(dataset$lag.quarterly.revenue)
v2 = c(dataset$price.index)
v3 = c(dataset$income.level)
v4 = c(dataset$market.potential)
X = cbind(v0, v1, v2, v3, v4)

X# Create vector y
y = c(dataset$y)

# B = inv(trans(X)*X)*trans(X)*Y
B = ginv(t(X) %*% X) %*% t(X) %*% y

# Predicting y value of sample
sampleData = c(1, 9.75, 4.3, 6.3, 13.2)

# So we get the y value from the sampleData
print(t(B) %*% sampleData)
