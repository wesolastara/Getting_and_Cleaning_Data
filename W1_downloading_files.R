## Downloading files

## Set/Get WD
getwd()
setwd("../")
getwd()
setwd("Getting_and_Cleaning_Data")
getwd()
setwd("data")
getwd()
setwd("../")
getwd()


if (!dir.exists("data")) {
  dir.create("data")
}

if (dir.exists("data")) {
  file.remove("data")
}

## Downloading files from http
download1 <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(download1, destfile = "./data/cameras.csv")
list.files("data")

Date_download1 <- date()
Date_download1


## Reading local files
readData1 <- read.table("./data/cameras.csv", sep = ",", header = T)
head(readData1)





