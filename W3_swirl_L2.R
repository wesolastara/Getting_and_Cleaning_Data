library(dplyr)
cran <- tbl_df(mydf)
rm("mydf")
rm("by_backage")
cran

?group_by
by_package <-  group_by(cran, package)
by_package <- group_by(cran, package)
by_package
summarize(by_package, mean = mean(size))

pack_sum <- dplyr:: summarise(by_package, count = n (), unique = n_distinct(ip_id), countries = n_distinct(country), avg_bytes = mean(size))
submit()
pack_sum

quantile(pack_sum$count, probs = 0.99)
top_counts <- filter(pack_sum, count > 679)
top_counts
View(top_counts)
top_counts_sorted <- arrange(top_counts, desc(count))
View(top_counts_sorted)

quantile(pack_sum$unique, probs = 0.99)
top_unique <- filter(pack_sum, unique > 465)
View(top_unique)
top_unique_sorted <- arrange(top_unique, desc(unique))
View(top_unique_sorted)

#chaining
result3 <-
  cran %>%
  group_by(package) %>%
  dplyr::summarize(count = n(),
                   unique = n_distinct(ip_id),
                   countries = n_distinct(country),
                   avg_bytes = mean(size)
  ) %>%
  filter(countries > 60) %>%
  arrange(desc(countries), avg_bytes)

# Print result to console
print(result3)

nxt()












