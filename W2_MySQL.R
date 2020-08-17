install.packages("RMySQL")
library(RMySQL)


ucscDb <- dbConnect(MySQL(), user = "genome",
                  host = "genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(ucscDb, "show databases;")
dbDisconnect(ucscDb)

result

hg19 <- dbConnect(MySQL(), user = "genome", db = "hg19", 
                  host = "genome-mysql.cse.ucsc.edu")
allTables <- dbListTables(hg19)
length(allTables)
head(allTables)

dbListFields(hg19, "affyU133Plus2") ## wyświetla nazwy kolumn
dbGetQuery(hg19, "select count(*) from affyU133Plus2") ## wprowadzenie zapytań do bazy
affyData <- dbReadTable(hg19, "affyU133Plus2") ## zassanie bazy danych
head(affyData)

##subsetting data

query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis <- fetch(query)  ## aport
quantile(affyMis$misMatches)
affyMisSmall <- fetch(query, n = 10)  ## aport tylko części
dbClearResult(query)  ## czyszczenie danych z query

head(affyMis,10)
affyMisSmall

identical(head(affyMis,10), affyMisSmall)

dim(affyMisSmall)

dbDisconnect(hg19)
