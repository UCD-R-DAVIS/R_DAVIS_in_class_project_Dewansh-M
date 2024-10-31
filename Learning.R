#the aim of this script is to go back to week 2 and try and play around with 
#some of the more elementary functions and language we use in R.

#I also want to use this to define everything so I can type it out, and have it be something I
#can return to for definitions and FAQs.

#basic mathematical calculations. Remember the importance of parentheses and square brackets

10 + 48
10/400
10/100
20*45
20^45
3^4
26&1

#interesting. why does clubbing 2 numbers with & in-between just give us TRUE?

(5043*43)-32/78*34


#challenge: create a data.set and try to find relevant percentages. eg: 
#find the % of people that walk in the morning


#week2 homework


set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2

na.omit(hw2)

prob1 <- na.omit(hw2)
prob1

prob2 <- prob1[prob1 > 14 & prob1 <38]

#note that here not having the prob1 before the information in the closed parentheses meant that R returned only true or false for the values. It basically checked to see if every number in prob1 falls between 14 and 38

#Round brackets (also known as "parenthesis") are used primarily when calling a function in R. Every function must be called using the round brackets. Some functions need additional information that must be provided to them inside the round brackets. This additional information is called the arguments of a function. For example, the c() function that concatenates or combines elements into a vector needs a sequence of elements as arguments for creating a vector, such as c(1, 3, 5, 7). There are also functions that do not require any arguments, and are simply called using a set of open and closed round brackets. For example, Sys.Date() or getwd().

#The square brackets are used for indexing into a vector, matrix, array, list or dataframe. You can think of the square brackets as marking the edges of a cell, column or row of a table. The square brackets are also called extraction operators as they are used to extract specific elements from a vector or matrix. You can get additional help on extraction operators by typing help(extract) in R.

times3 <- prob2*3
plus10 <- times3+10

final <- plus10[c(TRUE, FALSE)]
final

#----------------------------------

#challenge: try to create a set of values in weight, and also make character values for weight, and assign the numerical weight to each character weight class

weight_num <- c(56, 63,75, 77)
weight_num

weight_chr <- c("Alka", "Dewansh", "Preyansh", "Sundeep")
weight_chr 

cbind(weight_chr, weight_num)

w <- c("Alka" = 56, "Dewansh" = 63, "Preyansh" = 75, "Sundeep" = 77)
w
list(w)

assigned_weight <- data.frame(weight_chr, weight_num)

#Done, but the way I wanted to do this was to look assign vaulues from one vector to the other, because that would be easiest to do with longer datasets

Achieved!
  
#--------------------------------

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



#----------------------------



#----------------------------
#dollar sign operator ($) in R to create and access variables in lists and data frames.
#the summary function is used to summary is a generic function used to produce result summaries of the results of various model fitting functions. 

library(tidyverse)
