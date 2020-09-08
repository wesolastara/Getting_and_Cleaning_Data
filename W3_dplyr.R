library(dplyr)
chicago <- readRDS("./data/chicago.rds")
dim(chicago)
str(chicago)
names(chicago)

#wybieranie kilku kolumn
head(select(chicago, city:dptp)) # wszystkie kolumny w dataframe od city do dptp
head(select(chicago, -(city:dptp))) # wszystkie kolumny z data frame poza tymi z minusem

# filtrowanie
chic.f <- filter(chicago, pm25tmean2 > 30)
head(chic.f)
chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
head(chic.f)

#rearanżacja po wartościach kolumn
chicago <- arrange(chicago, date ) # kolejność rosnąca
head(chicago)
chicago <- arrange(chicago, desc(date)) # kolejność malejąca
head(chicago)
tail(chicago)

# zmiana nazwy zmiennej
chicago <- rename(chicago, pm25 = pm25tmean2, dewpoint = dptp) # nowa nazwa = stara nazwa
head(chicago)

#mutate transformacja istniejących zmiennych lub tworzenie nowych zmiennych
chicago <- mutate(chicago, pm25detrend = pm25 - mean(pm25, na.rm = T))
head(chicago)

#grupowanie - rozdział data frame po zmiennych - kategoryzacja
chicago <- mutate(chicago, tempcat = factor(1 * (tmpd >80), labels = c("cold", "hot")))
hotcold <- group_by(chicago, tempcat)
summarise(hotcold, pm25 = mean(pm25, na.rm = T), o3 = max(o3tmean2), no2 = median(no2tmean2)) # podsumowanie po każdej kategorii

#grupowanie - kategoryzacja danych ciąg dalszy
chicago <- mutate(chicago, year = as.POSIXlt(date)$year + 1900)
head(chicago)
years <- group_by(chicago, year)
summarise(years, pm25 = mean(pm25, na.rm = T), o3 = max(o3tmean2), no2 = median(no2tmean2)) # podsumowanie po każdej kategorii

# pipeline w jednym
chicago %>% mutate(month = as.POSIXlt(date)$mon +1) %>% group_by(month) %>% summarise(pm25 = mean(pm25, na.rm = T), o3 = max(o3tmean2), no2 = median(no2tmean2))

# dplyr może pracować z innymi paczkami jak data.table, SQL


