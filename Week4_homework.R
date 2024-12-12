library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv")

surveys
str(surveys)
#part 2

#weight between 30 nd 60

surveys %>% 
  filter(weight > 30 & weight < 60) %>%
  head(.,6) %>%


#head to show only first 6 rows 


str(surveys)

biggest_critters <- surveys %>% 
  filter(!is.na(weight)) %>% #to remove the NAs
  group_by(species_id, sex) %>% #to group the species by sex
  summarise(max_weight = max(weight)) #showing weight of that combo

biggest_critters

#NAs in sex column

biggest_critters %>% arrange(desc(max_weight))

#in descending order of the weights to see the biggest critters

#Take surveys, remove the rows where weight is NA and add a column that contains the average weight of each species+sex combination to the full surveys dataframe. Then get rid of all the columns except for species, sex, weight, and your new average weight column. Save this tibble as surveys_avg_weight.

surveys_avg_weight <- surveys %>% 
  filter(!is.na(weight)) %>% #filtering NAs
  group_by(species_id, sex) %>% #grouping again
  mutate(avg_weight = mean(weight)) %>% #adding new column and calling it avg_weight
  select(species_id, sex, weight, avg_weight) %>% #only printing these columns
  summary(surveys_avg_weight)

#take surveys_avg_weight and add a new column called above_average that contains logical values stating whether or not a row’s weight is above average for its species+sex combination (recall the new column we made for this tibble

surveys_avg_weight <- surveys_avg_weight %>% 
  mutate(above_average = weight > avg_weight)

surveys_avg_weight



surveys_mini 

#use the command above to get a mini version of the table

