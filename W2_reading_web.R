## Webscraping - programatically extracting data from 
## the HTML code of a website

## prymitywnie
con <- url("https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
htmlCode <- readLines(con)
close(con)
htmlCode

##przez XML
library(XML)
library(RCurl)
url <- "https://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en"
html <- htmlTreeParse(getURL(url), useInternalNodes = T)
xpathSApply(html, "//title", xmlValue)
xpathSApply(html, "//td[@class='gsc_a_c']", xmlValue)
html

##przez httr
library(httr)
html2 <- GET(url)
content2 = content(html2, as="text")
parsedhtml <- htmlParse(content2, asText = T)
parsedhtml
xpathSApply(parsedhtml, "//title", xmlValue)
?xpathSApply

## strony z hasłami prze httr
pg1 <- GET("http://httpbin.org/basic-auth/user/passwd")
pg1

pg2 <- GET("http://httpbin.org/basic-auth/user/passwd",
           authenticate("user", "passwd"))
pg2
?names
names(pg2)

?handle
google <- handle("https://google.com")
pg1 <-GET(handle = google, path = "/")
pg2 <-GET(handle = google, path = "search")
pg1
pg2

