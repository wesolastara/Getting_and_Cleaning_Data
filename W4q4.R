#Q1
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(URL, "./data/W4Q1.csv", method = "curl")
data <- read.csv("./data/W4Q1.csv")
strsplit(names(data), "wgtp") #""   "15"

#Q2
URL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(URL2, "./data/W4Q2.csv", method = "curl")
dataQ2 <- read.csv("./data/W4Q2.csv", skip = 4)
dataQ2$X.4 <- gsub(",", "", dataQ2$X.4)
dataQ2$X.4 <- as.numeric(dataQ2$X.4)
dataQ2 <- dataQ2[1:190,]
summary(dataQ2)  #377652

#Q3
dataQ2
grep("^United", dataQ2$X.3) #3

#Q4
URL3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(URL3, "./data/W4Q4_1.csv", method = "curl")
URL4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(URL4, "./data/W4Q4_2.csv", method = "curl")
dataQ4_190 <- read.csv("./data/W4Q4_1.csv", skip = 4)
dataQ4_edu <- read.csv("./data/W4Q4_2.csv")
head(dataQ4_190, 2)
head(dataQ4_edu, 10)
dataQ4_edu$Special.Notes

library(dplyr)
dataQ4_edu <- mutate(dataQ4_edu$Special.Notes, specialnotes = Special.Notes)
dataQ4_190 <- mutate(dataQ4_190, countrycode = X)
head(dataQ4_edu, 10)
head(dataQ4_190)

library(sqldf)
joining <- sqldf("SELECT O.countrycode, E.CountryCode, E.specialnotes FROM dataQ4_190 O INNER JOIN dataQ4_edu E ON O.countrycode = E.CountryCode ORDER BY E.specialnotes")
View (joining)

#Q5
install.packages("quantmod")
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
sampleTimes
class(sampleTimes)

library(lubridate)

lata2012 <- as.character(sampleTimes)
length (grep("^2012" , lata2012))















