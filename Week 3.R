#lists - multiple vectors in one

c(4, 6, "dog")
list (4, 6, "dog")

a <- list(4, 6, "dog")

#data.frames

letters

data.frame(letters)

df <- data.frame(letters)
length(df)
dim(df) #rows, columns
nrow(df)
ncol(df)

#a matrix is two dimensional (x and y) 
#it's always good to check how a matrix is going to be presented before letting the matrix be presented

#factors - if there is a level associated with a string of values

animals <- factor(c("pigs", "duck", "duck", "goose", "goose"))

#levels are determined by alphabet 

animals <- factor(x = animals, levels = c("goose", "pigs", "ducks"))
animals

#use the commands above to rearrange the levels

year <- factor (c(1978, 1980, 1934, 1979))
year

as.character(year)

#-------------------------------------------------------------------------

?read.csv

surveys <- read.csv("data/portal_data_joined.csv")
ncol(surveys)
nrow(surveys)
dim(surveys)
str(surveys)

#structure gives you comprehensive info about a data frame

class(surveys)
summary(surveys)

#we're always going to go rows, columns when specifying during indexing

surveys[1,5]
surveys[1:5]

surveys[,1]
surveys[,1:5]

head(surveys)

head(surveys[1:10,])

head(surveys["genus"])

head(surveys[["genus"]])

head(surveys['genus', 'species'])

surveys$genus     

surveys$hindfoot_length

install.packages('tidyverse')

library(tidyverse)

t_surveys <- read_csv("data/portal_data_joined.csv")
t_surveys
'print(n= species, taxa, plot_type)'
t_surveys

#yay!