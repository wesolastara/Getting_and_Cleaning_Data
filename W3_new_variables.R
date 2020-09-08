restData <- read.csv("./data/Restaurants.csv")

# Tworzenie sekwencji
s1 <- seq(1, 10, by=2) ;s1
s2 <- seq(1, 10, length=3); s2
x <- c(1, 3, 8, 25, 100, 45); seq(along = x)
?seq

# Subsetting variables
restData$nearMe <- restData$neighborhood %in% c("Roland Park", "Homeland")
table(restData$nearMe)

# Create binary variables
restData$zipWrong <- ifelse(restData$zipCode < 0, T, F)
table(restData$zipWrong, restData$zipCode < 0)

# Create categorical variables
?cut # zamienia numer na factor
restData$zipGroups <- cut(restData$zipCode, breaks = quantile(restData$zipCode))
table(restData$zipGroups)
table(restData$zipGroups, restData$zipCode)

# Create categortical variables v2
install.packages("Hmisc")
library(Hmisc)
restData$zipGroups <- cut2(restData$zipCode, g = 4)
table(restData$zipGroups)

# Create categorical variables v3 - factor variables
restData$zcf <- factor(restData$zipCode)
class(restData$zipCode)
class(restData$zcf)

# Poziomy factor variables
yesno <- sample(c("yes", "no"), size = 10, replace = T)
yesnofac <- factor(yesno, levels = c("yes", "no"))
?relevel
relevel(yesnofac, ref = "yes")
as.numeric(yesnofac) # najniższą nazywa 1, następne wg kolejności

# mutate tworzenie nowego data frame z nową kolumną będącą operacją na innych kolumnach
?mutate
library(plyr)
restData2 <- mutate(restData, zipGroups = cut2(zipCode, g = 4))
restData2
table(restData2$zipGroups)

# powszechnie używane transformacje
abs()
sqrt()
ceiling() # zawyżanie
floor() # zaniżanie
round(x, digits = n) # zaokrąglanie
signif(x, digits = n) # do n cyfr znaczących

# poczytać o plyr split, apply combine
?plyr
