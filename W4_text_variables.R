URL <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(URL, "./data/cameras.csv", method = "curl")
cameraData <- read.csv("./data/cameras.csv")
names(cameraData)

#wszystkie na małe litery
tolower(names(cameraData))

#split names
splitNames <- strsplit(names(cameraData), "\\.")
splitNames[[5]]
splitNames[[6]]


myList <- list(letters = c("A", "b", "c"), numbers = 1:3, matrix(1:25, ncol = 5))
head(myList)

#pierwszy elelent listy
myList[1]

#wektory z listy
myList$letters
myList[[1]]

#usuwanie kropek i tylko pierwsza część nazwy zmiennej
splitNames[[6]][1]
firstElement <- function(x){x[1]}
sapply(splitNames, firstElement)

URL1 <- "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/reviews.csv"
URL2 <- "https://raw.githubusercontent.com/jtleek/dataanalysis/master/week2/007summarizingData/data/solutions.csv"
download.file(URL1, "./data/reviews.csv", method = "curl")
download.file(URL2, "./data/solutions.csv", method = "curl")
reviews <- read.csv("./data/reviews.csv")
solutions <- read.csv("./data/solutions.csv")

head(reviews)
head(solutions)

#fixing characer vectors names
sub("_", "", names(reviews))

testName <- "this_is_a_test"
sub("_", "", testName)
gsub("_", "", testName)

#finding values
grep("Alameda", cameraData$intersection)
table(grepl("Alameda", cameraData$intersection))

#subsetting with values
cameraData2 <- cameraData[!grepl("Alameda", cameraData$intersection),]
cameraData2

#zwrot wartości z szukania danych
grep("Alameda", cameraData$intersection, value = T)

#sprawszanie czy coś występuje
grep("JeffStreet", cameraData$intersection)
length(grep("JeffStreet", cameraData$intersection))  # daje zero więc nie występuje

library(stringr)
#licznik liter
nchar("Jeffrey Leek")

#subsetting string
substr("Jeffrey Leek", 1,7)

#łączenie
paste("Jeffrey", "Leek", sep = "")
paste0("Jeffrey", "Leek")

#wycinanie spacji
str_trim("Jeff             ")

# kilka uwag:
# nazwy zmiennych
# 1. wszystkie na małe litery
# 2. pełna nazwa zmiennej
# 3. bez zduplikowanych danych
# 4. bez _, kropek lub spacji
#
# zmienne literowe:
# 1. powinny być zamienione na factory
# 2. powinny same tłumaczyć swoje wartości = True/False zamiast 0/1
# Male/Female zamiast 0/1 lub M/F






