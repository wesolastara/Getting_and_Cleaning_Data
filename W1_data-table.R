library(data.table)

DF = data.frame(x=rnorm(9), y = rep(c("a", "b", "c"), each = 3), z = rnorm(9))
DF

DT = data.table(x = rnorm(9), y = rep(c("a", "b", "c"), each = 3), z = rnorm(9))
DT

tables()

DT[2, ]
DT[, 1]
DT[DT$y=="a",]
DT[c(2, 3)]       ## tylko wiersz 2 i 3
DT[,c(2, 3)]      ## tylko kolumna 2 i 3

DT[, list(mean(x), sum(z))]


DT[,w:=z^2]

## zamiana wartości kolumny
DT2 <- DT
DT2
DT[, y:=2]    ## zmienia się wartość zarówno w DT jak i w DT2
DT

## złożone operacje

DT[, m:={tmp <- x + z; log2(tmp+5)}]
DT

## logiczne sprawdzanie
DT[, a:=x>0]
DT
## operacje tylko na zmiennych, które są po opercji logicznej
DT[, b:=mean(x+w), by=a]
DT

##specialne zmienne - .N liczenie po zmiennych
set.seed(123)
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
DT[, .N, by=x]

## klucze 

DT <- data.table(x = rep(c("a", "b", "c"), each=100), y=rnorm(300))
DT
setkey(DT, x)
DT['a']         ## wyszuka tylko po kluczu

## Joiny na tabelach
DT1 <- data.table(x = c("a", "a", "b", "dt1"), y = 1:4)
DT2 <- data.table(x = c("a", "b", "dt2"), z = 5:7)
setkey(DT1, x)
setkey(DT2, x)
DT3 <- merge(DT1, DT2)
DT3

## Fast reading
big_dataframe <- data.frame(x = rnorm(1E6), y = rnorm(1E6))
file <- tempfile()
write.table(big_dataframe, file = file, row.names=F, col.names = T, sep = "\t", quote = F)
system.time(fread(file))
system.time(read.table(file, header = T, sep = "\t"))

?melt
?dcast
library(swirl)
install_from_swirl("Getting and Cleaning Data")
swirl()
