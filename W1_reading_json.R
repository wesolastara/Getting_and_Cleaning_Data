install.packages("jsonlite")
library(jsonlite)
jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
names(jsonData)
names(jsonData$owner)
names(jsonData$owner)


myjson <- toJSON(iris, pretty = T)
cat(myjson)

iris2 <- fromJSON(myjson)
head(iris2)
