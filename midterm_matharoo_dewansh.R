library(tidyverse)

rm(url)

tyler_run <- read.csv('https://raw.githubusercontent.com/ucd-cepb/R-DAVIS/refs/heads/main/data/tyler_activity_laps_10-24.csv')

#Next, Tyler often has to take walk breaks between laps right now because trying to change how you’ve run for 25 years is hard. You can assume that any lap with a pace above 10 minute-per-mile pace is walking, so remove those laps. You should also remove any abnormally fast laps (< 5 minute-per-mile pace) and abnormally short records where the total elapsed time is one minute or less.

tyler_running <- tyler_run %>%
  filter(sport == 'running') %>% #filtered only running
  filter(minutes_per_mile >= 5 & minutes_per_mile <= 10) %>% #filtered minutes
  filter(total_elapsed_time_s >60) %>% #filtered elapsed time

#Create a new categorical variable, pace, that categorizes laps by pace: “fast” (< 6 minutes-per-mile), “medium” (6:00 to 8:00), and “slow” ( > 8:00). Create a second categorical variable, form that distinguishes between laps run in the year 2024 (“new”, as Tyler started his rehab in January 2024) and all prior years (“old”).
  
#mutate with case when to create conditional columns
  
tyler_running <- tyler_run %>%
  filter(sport == 'running') %>% 
  filter(minutes_per_mile > 5 & minutes_per_mile < 10) %>% 
  filter(total_elapsed_time_s >60) %>%
  mutate(pace = case_when(
    minutes_per_mile <6 ~ 'fast',
    minutes_per_mile >6 & minutes_per_mile <8 ~ 'medium',
    minutes_per_mile >8 ~ 'slow')) %>% #using specifics instead of TRUE in this case
  mutate(form = case_when(
    year == '2024' ~ 'new',
    T ~ 'old')) #question: could -'2024' work here?

#Identify the average steps per minute for laps by form and pace, and generate a table showing these values with old and new as separate rows and pace categories as columns. Make sure that slow speed is the second column, medium speed is the third column, and fast speed is the fourth column (hint: think about what the select() function does).

tyler_running <- tyler_run %>%
  filter(sport == 'running') %>% 
  filter(minutes_per_mile > 5 & minutes_per_mile < 10) %>% 
  filter(total_elapsed_time_s >60) %>%
  mutate(pace = case_when(
    minutes_per_mile <6 ~ 'fast',
    minutes_per_mile >6 & minutes_per_mile <8 ~ 'medium',
    minutes_per_mile >8 ~ 'slow')) %>% #using specifics instead of TRUE in this case
  mutate(form = case_when(
    year == '2024' ~ 'new',
    T ~ 'old')) %>% #use group by for form and pace and then summarize to get the average steps for those both
  group_by(form, pace) %>%
  summarize(avg_steps = mean(steps_per_minute)) %>%
  pivot_wider(id_cols = form, id_expand = avg_steps, names_from = pace)

#------------------------------------------------

#that is where i got stuck because I knew I had to use pivot wider but I forgot how and simply couldn't get it right so I looked at the answer key 

#------------------------------------------------

tyler_running <- tyler_run %>%
  filter(sport == 'running') %>% 
  filter(minutes_per_mile > 5 & minutes_per_mile < 10) %>% 
  filter(total_elapsed_time_s >60) %>%
  mutate(pace = case_when(
    minutes_per_mile <6 ~ 'fast',
    minutes_per_mile >6 & minutes_per_mile <8 ~ 'medium',
    minutes_per_mile >8 ~ 'slow')) %>% #using specifics instead of TRUE in this case
  mutate(form = case_when(
    year == '2024' ~ 'new',
    T ~ 'old')) %>% #use group by for form and pace and then summarize to get the average steps for those both
  group_by(form, pace) %>%
  summarize(avg_steps = mean(steps_per_minute)) %>%
  pivot_wider(id_cols = form, values_from = avg_steps, names_from = pace) %>%
  select(form, slow, medium, fast)

#yay!

#Finally, Tyler thinks he’s been doing better since July after the doctors filmed him running again and provided new advice. Summarize the minimum, mean, median, and maximum steps per minute results for all laps (regardless of pace category) run between January - June 2024 and July - October 2024 for comparison.

#i also completely blanked on how to do the final question and had to resort to the answer key

running_summ %>% filter(form == 'new form') %>%
  mutate(months = ifelse(month %in% 1:6,'early 2024','late 2024')) %>%
  group_by(months) %>% 
  summarize(
    min_spm = min(steps_per_minute),
    median_spm = median(steps_per_minute),
    mean_spm = mean(steps_per_minute),
    max_spm = max(steps_per_minute))
