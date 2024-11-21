#three times
#dates
#posixct (calendar time)
#posixlt (local time)

sample_dates_1 <- c("2018-02-01", "2018-03-21", "2018-10-05", 
                    "2019-01-01", "2019-02-18")
str(sample_dates_1)

sample_dates_1 <- as.Date(sample_dates_1) 
sample_dates_1

sample_dates_2 <- c("02-01-2018", "03-21-2018", "10-05-2018", 
                    "01-01-2019", "02-18-2019")
sample_dates_3<- as.Date(sample_dates_2, format = "%m-%d-%Y" )
sample_dates_3

as.Date("Jul 04, 2019", format=
          "%b%d, %Y")

tm1 <- as.POSIXct("2016-07-24 23:55:26")
tm1

tm2 <- as.POSIXct("25072016 08:32:07", format = "%d%m%Y %H:%M:%S")
tm2

tm3 <- as.POSIXct("2010-12-01 11:42:03", tz = "GMT")
tm3


library(tidyverse)
library(lubridate)

sample_dates_1 <- c("2018-02-01", "2018-03-21", "2018-10-05", 
                    "2019-01-01", "2019-02-18")
sample_dates_lub <- ymd(sample_dates_1)
sample_dates_lub

sample_dates_2 <- c("2-01-2018", "3-21-2018", "10-05-18", "01-01-2019", "02-18-2019")
#notice that some numbers for years and months are missing

sample_dates_lub2 <- mdy(sample_dates_2)
sample_dates_lub2

library(dplyr)
library(readr)

mloa1 <- read_csv("https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/main/data/mauna_loa_met_2001_minute.csv")
head(mloa1)
#R tried to guess for you that 
#the year, month, day, and hour columns were numbers


mloa2 <- read_csv("https://raw.githubusercontent.com/UCD-R-DAVIS/R-DAVIS/main/data/mauna_loa_met_2001_minute.csv",
                  col_types = "cccccccddddddddd")

mloa1$year <- as.character(mloa1$year)
head(mloa2)

glimpse(mloa1) 
glimpse(mloa2)


mloa2$datetime <- paste(mloa2$year, "-", mloa2$month,
                        "-", mloa2$day, ", ", mloa2$hour24, ":",
                        mloa2$min, sep = "")

head(mloa2$datetime)
glimpse(mloa2)


mloa2$datetime_test2 <- ymd_hm(mloa2$datetime, 
                               tz = "Pacific/Honolulu")

#GO BACK TO THE CLASS SCRIPT AND FOLLOW IT AGAIN AND FINISH THIS SECTION

#--------------------------------------------------------------------------

#Creating Functions ------------------------------------------------------
# Learning Objectives: 
## Define a function that takes arguments
## Set default value for function arguments
## Explain why we should divide programs into small, single-purpose functions


# Process to write your own function --------------------------------------
## temperature conversion example: Farenheit to Kelvin

((50 - 32) * (5/9)) + 273.15
((62 - 32) * (5/9)) + 273.15
((72 - 32) * (5/9)) + 273.15  

## How do write function: 
# 1. Identify what piece(s) will change within your commands -- this is your argument
# 2. Remove it and replace with object(s) name(s)
# 3. Place code and argument into the function() function

f_to_k <- function(tempF){
  ((tempF - 32) * (5/9)) + 273.15
}

f_to_k(tempF = 72)

## Pass-by-value: changes or objects within the function only exist within the function
## what happens in the function, stays in the function 

f_to_k <- function(tempF){
  k <- ((tempF - 32) * (5/9)) + 273.15
  return(k)
}

f_to_k(72)

#Using dataframes in functions -------------------------------------------
  # Say you find yourself subsetting a portion of your dataframe again and again 
  # Example: Calculate average GDP in a given country, in a given span of years, using the gapminder data

gapminder <- read_csv("https://ucd-r-davis.github.io/R-DAVIS/data/gapminder.csv")

gapminder %>%
  filter(country == "Canada", year %in% c(1950:1970)) %>%
  summarize(meanGDP = mean(gdpPercap, na.rm=TRUE))

#generalize this where we can change county and year range
avgGDP <- function(cntry, yr.range){
  gapminder %in%
    filter(country == cntry, year %in% yr.range) %>%
    summarize(meanGDP = mean(gdpPercap, na.rm = TRUE))
}

avgGDP(cntry = "United States", yr.range = 1950:1970)

# Challenge ---------------------------------------------------------------
# Write a new function that takes two arguments, the gapminder data.frame (d) and the name of a country (e.g. "Afghanistan"), and plots a time series of the country’s population. The return value from the function should be a ggplot object. Note: It is often easier to modify existing code than to start from scratch. To start out with one plot for a particular country, figured out what you need to change for each iteration (these will be your arguments), and then wrap it in a function.

country_plot <- function(cntry){
  d <- gapminder %>%
    select (country, year, pop) %>%
    filter (country == cntry) %>%
    ggplot(aes(x=year, y=pop)) +
    geom_point()
  return(d)
}  

country_plot("Afghanistan")
