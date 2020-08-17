library(XML)
library(RCurl)
xmlurl <- "https://www.w3schools.com/xml/simple.xml"
xmlDate <- date()
xmlDate
getwd()

doc <- xmlParse(getURL(xmlurl))
rootNode <- xmlRoot(doc)
rootNode
xmlName(rootNode)
names(rootNode)  

rootNode[[1]]
rootNode[[1]][[2]]

xmlSApply(rootNode, xmlValue)
xpathSApply(rootNode, "//name" ,xmlValue)
xpathSApply(rootNode, "//price" ,xmlValue)
xpathSApply(rootNode, "//description" ,xmlValue)[1]
