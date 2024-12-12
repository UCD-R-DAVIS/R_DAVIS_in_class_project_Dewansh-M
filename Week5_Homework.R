library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")

#Create a tibble named surveys from the portal_data_joined.csv file. Then manipulate surveys to create a new dataframe called surveys_wide with a column for genus and a column named after every plot type, with each of these columns containing the mean hindfoot length of animals in that plot type and genus. So every row has a genus and then a mean hindfoot length value for every plot type. The dataframe should be sorted by values in the Control plot type column. This question will involve quite a few of the functions you’ve used so far, and it may be useful to sketch out the steps to get to the final result.

surveys_wide <- surveys %>%
  filter(!is.na(hindfoot_length))%>% #filtering NA values
  group_by(genus, plot_type) %>% #because we only want hindfoot means for genus and plot type we group
  summarize(mean_hindfoot = mean(hindfoot_length)) %>% #mean acquired, now how do we sort by values?
  #arrrange?
  pivot_wider(names_from = plot_type, values_from = mean_hindfoot) %>% #unsure why we needed to do this - added this line of code after revisiting answers
  arrange(Control)

summary(surveys$weight) #to inspect quartile values

surveys %>% mutate(weight_cat = case_when(
    weight <= 20.00 ~ "small",
    weight > 20.00 & weight < 48.00 ~ "medium",
    T ~ "large"))

#the answer key specified that we could avoid the problem of specificity and just be more specific in our code

surveys %>% 
  mutate(weight_cat = case_when(
    weight <= 20.00 ~ "small",
    weight > 20.00 & weight < 48.00 ~ "medium",
    weight >= 48.00 ~ "large"
  ))

#although I don't see a difference?  
  