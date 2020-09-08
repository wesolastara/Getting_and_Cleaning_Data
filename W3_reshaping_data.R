# tidy data:
# 1. each variable forms a column
# 2. each observation forms a row
# 3. each file stores data about one kind of observation

install.packages("reshape2")
library(reshape2)
data("mtcars")
head(mtcars)

# nowa kolumna z nazwami samochodów
mtcars$carname <- rownames(mtcars)

# Metling data frames - frame z jedną zmienną
?melt
carMelt <- melt(mtcars, id = c("carname", "gear", "cyl"), measure.vars = c("mpg", "hp"))
head(carMelt)
tail(carMelt)
carMelt
mtcars

# Casting data frames
?dcast
cylData <- dcast(carMelt, cyl ~ variable)
cylData  # wypluwa ilość pomiarów dla każdego z cylindrów
cylData <- dcast(carMelt, cyl ~ variable, sum)
cylData  # wypliwa średnią dla kadego z cylindrów

# Ave values
data("InsectSprays")
head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)

# inaczej
#1 split na listę
?split
spIns <- split(InsectSprays$count, InsectSprays$spray)
spIns
#2 apply dla listy
sprCount <- lapply(spIns, sum)
sprCount
#3 combine
unlist(sprCount)
#3 lub apply + combine
sapply(spIns, sum)

# jeszcze inaczej - wszystko w jednym
ddply(InsectSprays, .(spray), summarise, sum=sum(count))

# tworzenie nowej zmiennej
spraySums <- ddply(InsectSprays, .(spray), summarise, sum = ave(count, FUN = sum))
?ave
spraySums

