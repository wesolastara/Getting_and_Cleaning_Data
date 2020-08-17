getwd()
install.packages("rJava")
install.packages("xlsx")

library(xlsx)

stolyData <- read.xlsx("./data/stoly.xlsx", sheetIndex = 1)
stolyData
colIndex <- 2:7
rowIndex <- 1:10
stolyData2 <- read.xlsx("./data/stoly.xlsx", sheetIndex = 1, colIndex = colIndex, rowIndex =  rowIndex)
stolyData2

## zapisywanie danych Excel
write.xlsx(stolyData2, "./data/stoly2.xlsx")
