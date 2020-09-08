set.seed(13435)
X <- data.frame("var1"=sample(1:5), "var2"=(sample(6:10)), "var3"=(11:15))
X <- X[sample(1:5),]; X$var2[c(1,3)] = NA
X
# Wybieranie kolumny 1
X[,1]
X[, "var1"]
# Wybieranie wierszy i kolumn
X[1:2, "var2"]

# Wybieranie logiczne
X[(X$var1 <=3) & (X$var3 > 12),] # logiczne 1
X[(X$var1 <=3) | (X$var3 >= 14),] # logiczne lub

# usuwanie NA na podstawie większe
X[which(X$var2 >6),]

# sortowanie
sort(X$var1)
sort(X$var1, decreasing = T)
sort(X$var2, na.last = T)

# porządkowanie
X
X[order(X$var1),]
X[order(X$var1, X$var3),]

# porządkowanie z plyr
library(plyr)
arrange(X, var1)
arrange(X, desc( var1))

# dodawanie kolumn
X$var4 <- rnorm(5)
X

Y <- cbind(X, "var5"=rnorm(5))
Y

# dodawanie wierszy

Z <- rbind(Y, rnorm(5))
Y
Z

