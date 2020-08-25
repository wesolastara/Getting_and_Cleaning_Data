##group - contain data sets and metadata

##datasets - multidimensional arrays

library(rhdf5)

#tworzenie pliku
created = h5createFile("example.h5")
created

#tworzenie grup
created = h5createGroup("example.h5", "foo")
created = h5createGroup("example.h5", "baa")
created = h5createGroup("example.h5", "foo/fooba")
h5ls("example.h5")

#zapisywanie do grup
A <- matrix(1:10, nc = 2, nr = 5)
h5write(A, "example.h5", "foo/A")
B <- array(seq(0.1, 2.0, by=0.1), dim = c(5, 2, 2))
attr(B, "scale") <- "liter"
h5write(B, "example.h5", "foo/fooba/B")
h5ls("example.h5")

#zapisywanie zbioru danych
df <- data.frame(1L:5L, seq(0,1,length.out = 5), c("ab", "ds", "adq", "ad11", "ds2r"), stringsAsFactors = F)
df
h5write(df, "example.h5", "df")
h5ls("example.h5")

#czytanie danych
readA <- h5read("example.h5", "foo/A")
readB <- h5read("example.h5", "foo/fooba/B")
readdf <- h5read("example.h5", "df")

readA
readB
readdf

#modyfikowanie danych
h5write(c(12,13,14), "example.h5", "foo/A", index=list(1:3, 1))
h5read("example.h5", "foo/A")
