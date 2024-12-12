library(tidyverse)

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

#First calculate mean life expectancy on each continent. Then create a plot that shows how life expectancy has changed over time in each continent. Try to do this all in one step using pipes! (aka, try not to create intermediate dataframes)

#Look at the following code and answer the following questions. What do you think the scale_x_log10() line of code is achieving? What about the geom_smooth() line of code?
  
gapminder

#use group by to bring the life expectancy and continent and year together

gapminder1 <- gapminder %>%
  group_by(continent, year, lifeExp) %>%
  summarize(mean_life = mean(lifeExp)) %>%
  ggplot() +
  geom_point(aes(x= mean_life, y= year, colour = continent)) +
  geom_line(aes(x= mean_life, y= year, colour = continent))

#this didn't work, why? switch x and y around?

gapminder1 <- gapminder %>%
  group_by(continent, year, lifeExp) %>%
  summarize(mean_life = mean(lifeExp)) %>%
  ggplot() +
  geom_point(aes(x= year, y= mean_life, colour = continent)) +
  geom_line(aes(x= year, y= mean_life, colour = continent))

#------------------------------------------------------------

#at this point I had to use the solution 

#I realised the problem! I was assigning values to the code when I shouldn't have been
#----------------------------------------------------------

gapminder %>%
  group_by(continent, year) %>%
  summarize(mean_life = mean(lifeExp)) %>%
  ggplot() +
  geom_point(aes(x= year, y= mean_life, colour = continent)) +
  geom_line(aes(x= year, y= mean_life, colour = continent))

#is my original code with life exp in group by diff?


gapminder %>%
  group_by(continent, year, lifeExp) %>%
  summarize(mean_life = mean(lifeExp)) %>%
  ggplot() +
  geom_point(aes(x= year, y= mean_life, colour = continent)) +
  geom_line(aes(x= year, y= mean_life, colour = continent))

#oh dear lord yes it is

#Create a boxplot that shows the life expectency for Brazil, China, El Salvador, Niger, and the United States, with the data points in the backgroud using geom_jitter. Label the X and Y axis with “Country” and “Life Expectancy” and title the plot “Life Expectancy of Five Countries”.

gapminder %>%
  Select('Brazil', 'China', 'El Salvador', 'Niger', 'United States') %>%

#no, select doesn't seem to work here, need to refer to the solutions again
  
countries <- c("Brazil", "China", "El Salvador", "Niger", "United States") #create a vector with just the countries we are interested in

gapminder %>% 
  filter(country %in% countries) %>% 
  ggplot(aes(x = country, y = lifeExp))+
  geom_boxplot() +
  geom_jitter(alpha = 0.3, color = "blue")+
  theme_minimal() +
  ggtitle("Life Expectancy of Five Countries") + #title the figure
  theme(plot.title = element_text(hjust = 0.5)) + #centered the plot title
  xlab("Country") + ylab("Life Expectancy") #how to change axis names
  
