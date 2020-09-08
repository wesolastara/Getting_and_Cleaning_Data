restData <- read.csv("./data/Restaurants.csv")
head(restData, 3)
tail(restData, 3)
summary(restData)
str(restData)

#kwantyle
quantile(restData$councilDistrict, na.rm = T)
quantile(restData$councilDistrict, probs = c(0.5, 0.75, 0.9))

#tworzenie tabel
table(restData$zipCode, useNA = "ifany")
table(restData$councilDistrict, restData$zipCode)

#sprawdzanie NA
sum(is.na(restData$councilDistrict))
any(is.na(restData$councilDistrict))
all(restData$zipCode > 0)
colSums(is.na(restData))
all(colSums(is.na(restData))==0)

#sprawdzanie specyficznych wartości
table(restData$zipCode %in% c("21212"))
table(restData$zipCode %in% c("21212", "21213"))
restData[restData$zipCode %in% c("21212", "21213"),]

#cross tabs
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)

xt <- xtabs(Freq ~ Gender + Admit, data = DF)
xt

#flat tables
data("warpbreaks")
warpbreaks
warpbreaks$replicate <- rep(1:9, len = 54)
warpbreaks

xt <- xtabs(breaks ~., data = warpbreaks)
xt
ftable(xt)

#size of data
fakedata <- rnorm(1e5)
object.size(fakedata)
print(object.size(fakedata), units = "Mb")
