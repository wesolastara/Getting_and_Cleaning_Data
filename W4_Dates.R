d1 <- date()
d1
class(d1)

d2 <- Sys.Date()
d2
class(d2)

# formatowanie dat
?format.POSIXlt
format(d2, "%a%b%d")

x <- c("1jan1960", "2jan1960", "31mar1960", "30jul1960")
z <- as.Date(x, "%d%b%Y")
z
z[1] - z[2]
as.numeric(z[1] - z[2])

weekdays(d2)
months(d2)
julian(d2)
julian.Date(d2)

#łatwa praca z datami bez formatowania
library(lubridate)
ymd("20140515")
mdy("07/12/1998")
dmy("05/10/2020")

ymd_hms("2020 10 28 10 57 38")
ymd_hms("2020 10 28 10 57 38", tz = "Pacific/Auckland")
?ymd
?Sys.timezone

wday(z[1], label = T)



