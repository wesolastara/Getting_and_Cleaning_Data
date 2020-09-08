##1

library(httr)
oauth_endpoints("github")
myapp <- oauth_app("github",
                   key = "92e05cf70f5545539eec",
                   secret = "ed853384df9383843bb8a402bd3075a1eb99d03b"
)

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
json1 <- content(req)
gitDF = jsonlite::fromJSON(jsonlite::toJSON(json1))
gitDF
gitDF[gitDF$full_name=="jtleek/datasharing", "created_at"]


##2
install.packages("sqldf")
library(sqldf)


acs <- read.csv("./data/getdata_data_ss06pid.csv")

sqldf("SELECT pwgtp1 FROM acs")
query1 <- read.csv.sql("./data/getdata_data_ss06pid.csv", sql = "SELECT pwgtp1, AGEP FROM file WHERE AGEP < 50")
query1

##3
query2 <- read.csv.sql("./data/getdata_data_ss06pid.csv", sql = "SELECT distinct AGEP FROM file")
query2
class(query2)
query3 <- as.vector(query2)
query4 <- query3[query3[1:91, ],]

query22 <- as.data.frame(unique(acs$AGEP))
query22
class(query22)
query5 <- query22[query22[1:91, ],]

query4


identical(query4, query5)
?identical

#4

library(XML)
library(RCurl)

con = url("http://biostat.jhsph.edu/~jleek/contact.html")
liczba10 <- readLines(con)[10]
liczba20 <- readLines(con)[20]
liczba30 <- readLines(con)[30]
liczba100 <- readLines(con)[100]
liczba10
nchar(liczba10)
nchar(liczba20)
nchar(liczba30)
nchar(liczba100)

##5
path <- "./data/getdata_wksst8110.for"

?read.fortran
plik_elninio <- read.fortran(path, c ("1A9", "1F3.1", "1F2.1", "1F3.1", "1F2.1", "1F3.1", "1F2.1", "1F3.1", "1F2.1"),  skip = 10)
plik_elninio <- read.fortran(path, c ("1A10", "1X5","1F4.0", "1F4.0", "1X5", "1F4.0"),  skip = 4)
plik_elninio
nrow(plik_elninio)
summary(plik_elninio)
sum(plik_elninio$V4)














