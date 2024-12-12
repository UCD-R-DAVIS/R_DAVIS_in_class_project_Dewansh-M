library(tidyverse)
library(ggplot2)

tyler_run <- read_csv("https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/refs/heads/main/data/tyler_activity_laps_12-6.csv")

#Filter out any non-running activities.

tyler_running <- tyler_run %>%
  filter(sport == 'running')# filtered out everything but running

#We are interested in normal running. You can assume that any lap with a pace above 10 minutes_per_mile pace is walking, so remove those laps. You should also remove any abnormally fast laps (< 5 minute_per_mile pace) and abnormally short records where the total elapsed time is one minute or less.

tyler_running <- tyler_run %>%
  filter(sport == 'running') %>%
  filter(minutes_per_mile >= 5 & minutes_per_mile <= 10) %>% #filtered minutes
  filter(total_elapsed_time_s >60) #filtered elapsed time

#Group observations into three time periods corresponding to pre-2024 running, Tyler’s initial rehab efforts from January to June of this year, and activities from July to the present.

tyler_running <- tyler_run %>%
  filter(sport == 'running') %>%
  filter(minutes_per_mile >= 5 & minutes_per_mile <= 10) %>% 
  filter(total_elapsed_time_s >60) %>%
  mutate(time_periods = case_when(
    timestamp < '2023-12-31 18:42:58' ~ 'pre2024_running'
    timestamp > '2024-01-03 00:26:58' & timestamp < '2024-06-30 00:48:04'  ~ 'initial_rehab'
    timestamp > '2024-07-04 21:51:34'  ~ 'present'))

#why doesn't this work? 

#--------------------------------------------------------

#I ran out of my 1 hour here. I took far too long to figure out how to break the times up into the categories. I will continue to try after submitting this and once the answer key is out

    
  