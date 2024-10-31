library(tidyverse)
surveys <- read_csv("data/portal_data_joined.csv") %>% 
  filter(complete.cases(.)) #remove all NAs

ggplot(data = surveys, mapping = aes(x=weight, y=hindfoot_length)) + #plus is like adding layers to the plot
  geom_point(aes(colour=genus)) +
  geom_smooth(aes(colour=genus))

#universal geom setting
ggplot(data = surveys, mapping = aes(x=weight, y=hindfoot_length, colour=genus)) + #plus is like adding layers to the plot
  geom_point() +
  geom_smooth()

#the difference between the first set of commands and the second is that we're specifying what we want coloured (geom) and then just adding the geoms below that we want visualised

surveys_plot <- ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length, colour=genus)) + 
  geom_point(alpha=0.1)+
  geom_smooth(alpha=0.8)
surveys_plot

surveys_plot <- ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length, colour=)) + 
  geom_point(alpha=0.1)+
  geom_smooth(alpha=0.8)
surveys_plot

library(tidyverse)
surveys_complete <- read_csv("data/portal_data_joined.csv") %>% 
  filter(complete.cases(.))

yearly_counts <- surveys_complete %>%
  count(year, species_id)

ggplot(data=yearly_counts) +
  geom_line(aes(x=year, y=n))

ggplot(data=yearly_counts,
       mapping=aes(x=year, y=n, group=species_id))+
  geom_line(aes(colour=species_id))

ggplot(data=yearly_counts,[yearly_counts$species_id%in%c('BA','DM','DO','DS','NL')]
       mapping=aes(x=year, y=n, group=species_id))+
  geom_line()+
  facet_wrap(~species_id, scales= 'free_y')+
  theme_bw()

#facet wrap allows you to individualise each plotted line

install.packages('ggthemes')
install.packages('tigris')
