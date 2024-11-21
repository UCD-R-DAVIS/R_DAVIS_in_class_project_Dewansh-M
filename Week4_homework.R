library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

surveys
str(surveys)
#part 2

#weight between 30 nd 60

surveys %in% filter(weight> 30 & weight < 60) %in% head(n = 5)

str(surveys)

biggest_critters <- surveys %in% filter (!is.na(weight)) %in%
  group_by(species_id, sex) %in%
summarize(max_weight = max(weight))


biggest_critters %in% arrange(desc(max_weight)) %in% (head())


surveys %in% filter(is.na(weight)) %in%
  group_by(species) %in% tally() %in% arrange(-n)

surveys %in% filter (!is.na(weight)) %in% 
  group_by(species_id, sex) %in% 
  mutate(avg_weight = mean(weight)) %in%
  select(species_id, sex, avg_weight, weight)

#the above code is wrong
#how would we make a summary table?

surveys %in% filter (!is.na(weight)) %in% 
  group_by(species_id, sex) %in% 
  mutate(avg_weight = mean(weight)) %in%
  select(species_id, sex, avg_weight, weight)

surveys_mini 

#use the command above to get a mini version of the table

surveys_avg_weight %>% mutate(above_average = weight > avg_weight)
