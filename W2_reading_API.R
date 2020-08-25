library(httr)

myapp <- oauth_app("twitter", key = "iU8GIk3PgGaknd8fldq3RcKJz", secret = "igmrsnPSJFzHYeamVxOD8ZpTngt7OqWhg6dwrbPA7qG0RU82ju")
sig <- sign_oauth1.0(myapp, token = "1296428634186698756-wiqwCKHLpiZoGd1pjdklb8jcaOtuI6", token_secret = "jfHqGLVfgsu0aQxNQo6aQoqMiYMYpX3OyzvbWuTZxhqFh")
homeTL <- GET("https://api.twitter.com/2/tweets/440322224407314432?expansions=author_id", sig)
homeTL

install.packages("RJSONIO")
library(RJSONIO)

json1 <- content(homeTL)
json2 <- jsonlite::fromJSON(toJSON(json1))
json2
