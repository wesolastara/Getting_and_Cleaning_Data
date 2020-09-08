library(swirl)
swirl()
Maciej
1
3

library(tidyr)
3

#1
students
?gather
gather(students, sex, count, -grade)

#2
head(students2)
res <- gather(students2, sex_class, count, -grade)
res
?separate
separate(res, sex_class, c("sex", "class"))
##2 + chain
students2 %>%
  gather( sex_class, count, -grade ) %>%
  separate( sex_class, c("sex", "class")) %>%
  print

#3
students3
students3 %>%
  gather( class, grade , class1:class5 , na.rm = TRUE) %>%
  print
submit()
?spread

students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test, grade) %>%
  print 

library(readr)
parse_number("class5")

library(dplyr)
students3 %>%
  gather(class, grade, class1:class5, na.rm = TRUE) %>%
  spread(test, grade) %>%
  mutate(class, class = parse_number(class))  %>%
  print
submit()

#4
students4

student_info <- students4 %>%
  select(id, name, sex) %>%
  unique() %>%
  print


gradebook <- students4 %>%
  select(id, class, midterm, final) %>%
  print
submit()

#5
passed
failed

passed <- passed %>% mutate( status = "passed")
failed <- failed %>% mutate( status = "failed")

?bind_rows

bind_rows(passed, failed)

#6
sat
sat %>%
  select(-contains("total")) %>%
  gather(part_sex, count, -score_range) %>%
  separate(part_sex, c("part", "sex")) %>%
  print
submit()












