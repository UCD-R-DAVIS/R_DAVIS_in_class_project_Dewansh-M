#week3

#cbind allows us to view various created. vectors in a tabular format.

c("a","b","c","d")
list("a","b","c","d")

heights <- c(4, 83, 2, 91, NA, 12)
heights

sum(heights)

#note how with an NA in the vector, R can't find the sum of the heights. To do so, we need to remove NA from that equation.

sum(heights, na.rm = T)

#and then it works! What the above is doing basically is it's making it so that NA removes NA if it sets to TRUE or T, because the defualt vaulue is F   

#there is another way to remove na values from the vector itself

is.na(heights)
#[1] FALSE FALSE FALSE FALSE  TRUE FALSE
!is.na(heights)
#[1]  TRUE  TRUE  TRUE  TRUE FALSE  TRUE

#the above is the way to check if the vector has NAs

heights[!is.na(heights)]

#and that removes NAs from height

#complete.cases is also a way to completely return vectors that have no NA values

heights[complete.cases(heights)]


#lists - multiple vectors in one

c(4, 6, "dog")
list (4, 6, "dog")

a <- list(4, 6, "dog")

b <- list(4, letters, "dog")
str(b) 


#data.frames


data.frame(letters)

df <- data.frame(letters)
length(df)
dim(df) #rows, columns
nrow(df)
ncol(df)

df2 <- data.frame(letters, letters)

df3 <- data.frame(1:26, letters, "dog, cat")
df3

#how do we make it so that the data frame replicates characters?

#matrices need to be the same kinds of data (all numerical or all characters)

matrix(nrow=10, ncol=10)
matrix(1:10, nrow=10, ncol=10)

#a matrix is two dimensional (x and y) 
#it's always good to check how a matrix is going to be presented before letting the matrix be presented
#note how in the matrix function we ran above, the rows are just 1 value across all the columns. To fix that, we should use the byrow command

matrix(1:10, nrow=10, ncol=10, byrow=T)

#this, however, the columns are now just 1 number. How do we fix this?

matrix(1:10, nrow)

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