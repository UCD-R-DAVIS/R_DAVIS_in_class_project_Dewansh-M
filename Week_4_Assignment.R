library("tidyverse")

surveys <- read_csv("data/portal_data_joined.csv")

str(surveys)

#first, we need to subset surveys by keeping rows with weight between 30 and 60, and printing the first 6 rows out

surveys <- read_csv("data/portal_data_joined.csv")
  
surveys_4 <- surveys %>% 
  filter(weight >= 30 & weight <= 60) %>%
  filter(nrow(1:6))

select(surveis.na()select(surveys, plot_id, species_id, weight)

filter(surveys, year == 1995)