# kombinacja liter i metacharacters
# metacharacters tworzą gramatykę języka
# regular expressions mają bogatą bibliotekę metacharacterów
# umożliwiając szukanie specjalnych zwrotów 

# Literals - słowa które dokładnie pasują

# metacharacters: - można stosować się z grep, grepl, sub, gsub
# ^i think - wyszuka tylko linijki, które zaczynają się od i think
# morning$ - wyszuka tylko linijki kończące się na morning
# [Bb] [Uu] [Ss] [Hh] - wyszuka wszystkie bush niezależnie od wielkości litery
# ^ [0-9] [a-zA-Z] - wyszuka wszystko co zaczyna się jakąś liczbą i ma później dwie litery
# . (kropka) - zastępuje każdy znak
# | (lub) - wyszuka lewą lub prawą stronę, można daż dużo np.
# pies|kot|mysz|nosorożec
#
# ^[Gg]ood|[Bb]ad - wyszuka tylko gdy pierwsze jest Ggod lub gdy gdzieś jest bad
# ^([Gg]ood|[Bb]ad) - wyszuka tylko gdy pierwsze jest Ggod lub Bbad
# ( [Ww]\.)? - wyszuka gdy jest lub gdy nie ma W. lub w. Backslash definiuje kropę w szukaniu
# ponieważ kropka oznacza każdy znak
# * oznacza cokolwiek obojętnie ile razy, np. (.*) wyszuka wszystko w nawiasie
# + oznacza jeden, np. [0-9]+ (.*) [0-9]+ - wyszuka jedną liczbę, później cokolwiek zakończone jedną liczbą
#
# {1,5} - wyszuka coś co powtarza się przynajmniej 1 raz ale mniej niż 5
# {5} - wyszuka coś co powtarza się dokładnie 5 razy
# {5,} - wyszuka coś co powtarza się przynajmniej 5 razy
#
# \1 - wyszuka to samo co w pierwszym nawiasie
#
# ^s(.*)s - wyszuka najdłuższą fraze zaczynającą się na s i kończącą się na s
# ^s(.*?)s$ - wyszuka krótszy ciąg zaczynający się na s i kończący się na s








