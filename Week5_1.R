library(tidyverse)
tail <- read_csv("data/tail_length.csv")
surveys <- read_csv("data/portal_data_joined.csv")

dim(tail)
dim(surveys)
head(tail)

surveys_inner <- inner_join(x = surveys, y = tail)
dim(surveys_inner)
head(surveys_inner)


surveys_left <- left_join(x= surveys, y=tail) 
dim(surveys_left)
table(is.na(surveys_left$tail_length))

surveys_right <- right_join(x=surveys, y=tail)
dim(surveys_right)

surveys_full <- full_join(x= surveys, y=tail)
dim(surveys_full)

#test - in case there was nothing in common
full_join(surveys, tail %>% select(-record_id))
cross_join(surveys, tail %>% select(-record_id))

all(surveys$record_id %in% tail$record_id)
all(tail$record_id %in% surveys$record_id)


#pivots change shapes
surveys_mz <- surveys %>%
  filter(!is.na(weight)) %>%
  group_by(genus, plot_id) %>%
  summarize(mean_weight = mean(weight))


surveys_mz %in% surveys
  pivot_wider(id_cols = 'genus',
              names_from = 'plot_id',
              values_from = 'mean_weight')
