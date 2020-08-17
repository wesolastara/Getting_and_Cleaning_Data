library(data.table)
#Ankieta ACS

tabela1 <- read.csv("./data/getdata_data_ss06hid.csv")
tabela1
tabela2 <- tabela1[tabela1$VAL=="24",]
summary(tabela2)
library(dplyr)
filtrowanie1 <- filter(tabela1, tabela1$VAL >= 24)
filtrowanie2 <- filtrowanie1$VAL
length(filtrowanie2)

## FILTROWANIE FES
filtrowanie_FES <- filter(tabela1, tabela1$FES)
tabela1$FES

## NGAP
library(xlsx)
colIndex <-7:15 
rowIndex <- 18:23
dat <- read.xlsx("./data/getdata_data_DATA.gov_NGAP.xlsx", sheetIndex = 1, colIndex = colIndex, rowIndex = rowIndex)

dat
sum(dat$Zip*dat$Ext,na.rm=T)

## XML Baltimore
xmlurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
library(XML)
library(RCurl)
xmldocument <- xmlParse("./data/getdata_data_restaurants.xml")
rootNode <- xmlRoot( xmldocument)
xmlName(rootNode)
names(rootNode)
rootNode[[1]]
lista_kodow <- as.data.table (  xpathSApply(rootNode, "//zipcode" ,xmlValue))
class(lista_kodow)
library(dplyr)
head(lista_kodow)
filtrowanie_kodow <- filter (lista_kodow, lista_kodow$V1 == 21231 )
filtrowanie_kodow



## fread ACS
library(data.table)
DT <- fread("./data/getdata_data_ss06pid.csv")
#1 dobrze
system.time(DT[,mean(pwgtp15), by=SEX]) ## 0,001
DT[,mean(pwgtp15), by=SEX]
#2  źle
system.time(rowMeans(DT)[DT$SEX==1]) ##0,433
rowMeans(DT)[DT$SEX==1]
#3 źle
system.time(tapply(DT$pwgtp15, DT$SEX, mean))
tapply(DT$pwgtp15, DT$SEX, mean)
#4 źle
system.time(mean(DT$pwgtp15, by=DT$SEX))
mean(DT$pwgtp15, by=DT$SEX)
#5 nie ten rozdział
system.time(sapply(split(DT$pwgtp15, DT$SEX), mean))
sapply(split(DT$pwgtp15, DT$SEX), mean)
#6 wolne
system.time(mean(DT[DT$SEX == 1,]$pwgtp15))
mean(DT[DT$SEX == 1,]$pwgtp15)

