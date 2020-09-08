#Q1

URL1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(URL1, destfile =  "./data/acs1.csv", method = "curl")
Q1 <- read.csv("./data/acs1.csv")
Q1
library(dplyr)


Q1 <- mutate(Q1, agricultureLogical = ACR == 3 & AGS ==6 )
Q1

which (    mutate(Q1, agricultureLogical = ACR == 3 & AGS ==6 )    )

which(Q1$agricultureLogical )  #125  238  262


#Q2
library(jpeg)
URL2 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(URL2, destfile = "./data/jeff.jepg")
jeff <- readJPEG("./data/jeff.jepg", native = T)
quantile(jeff, probs = 0.3)  #-15258512
quantile(jeff, probs = 0.8)  #-10575416

#Q3
URL3 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(URL3, destfile = "./data/GDP190.csv", method = "curl")
URL4 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(URL4, destfile = "./data/GDP190edu.csv", method = "curl")
gpd <- read.csv("./data/GDP190.csv", skip = 4)
gpdedu <-read.csv("./data/GDP190edu.csv")
head(gpd)


head(gpdedu)
gpd_country_code <- mutate(gpd, CountryCode = X, GPD_isNA = !is.na(X.4))
gpd_country_code2 <- gpd_country_code[which(gpd_country_code$GPD_isNA == T),]
gpd_country_code2 <- mutate(gpd, CountryCode = X, GPD =  X.4)
head(gpd_country_code2)
gpd_country_code2$GPD <- gsub("\\,", "", gpd_country_code2$GPD)
head(gpd_country_code2)
gpd_country_code2$GPD <- as.numeric(gpd_country_code2$GPD)
gpd_country_code2 <- gpd_country_code2[1:190,]


head(gpd_country_code2)

gpdedu <- mutate(gpdedu, LongName = Long.Name)
gpdedu <- mutate(gpdedu, IncomeGroup = Income.Group)
head(gpdedu)
View(gpdedu)


library(sqldf)
sqldf("SELECT CountryCode FROM gpdedu")

sqldf("SELECT O.CountryCode, O.LongName, C.CountryCode, C.GPD from gpdedu O INNER JOIN gpd_country_code2 C ON O.CountryCode = C.CountryCode ORDER BY C.GPD")
#189 matches, 13th country is St.Kitts and Nevis


#Q4
#ave GDP High income OECD

gpd_country_code2 <- mutate(gpd_country_code2, ranking = 1:190)
gpd_country_code2$ranking <- as.numeric(gpd_country_code2$ranking)
str(gpd_country_code2)
head(gpd_country_code2)


av_non <- sqldf("SELECT O.IncomeGroup, C.ranking from gpdedu O INNER JOIN gpd_country_code2 C ON O.CountryCode = C.CountryCode WHERE O.IncomeGroup ='High income: nonOECD'")
summary(av_non)  #91.91 
av_OEC <- sqldf("SELECT O.IncomeGroup, C.ranking from gpdedu O INNER JOIN gpd_country_code2 C ON O.CountryCode = C.CountryCode WHERE O.IncomeGroup ='High income: OECD'")
summary(av_OEC)  #32.97 


#Q5
head(gpdedu)
head(gpd_country_code2)
str(gpd_country_code2)

?quantile
?seq
quantile(gpd_country_code2$GPD, probs = seq(0, 1, 0.2))
gpd_country_code2 <- gpd_country_code2[gpd_country_code2$GPD > 262644,]
av_non <- sqldf("SELECT O.IncomeGroup, C.ranking from gpdedu O INNER JOIN gpd_country_code2 C ON O.CountryCode = C.CountryCode ORDER BY O.IncomeGroup")
av_non #5











