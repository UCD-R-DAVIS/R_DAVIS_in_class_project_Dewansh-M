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

#factors are same as characters but have some kind of level to them, especially handy when you want to give them a certain order. 

response1 <- factor(c("no", "yes", "maybe", "never"))
response

typeof(response)

#R automatically assigns factors by alphabet

#to work around that, we need to let R know what the response should look like

response <- factor(response, levels = c("yes", "maybe", "no"))
response

#----------------------------

#working with spreadsheets - look at week 3 homework for this

surveys <- read.csv("data/portal_data_joined.csv")

head(surveys[1])

summary(surveys)
ncol(surveys)

head(surveys, n=12) #read head description for more info for why this happens, but essentially, you get to pull the first few bits of data of a specified amount

summary.data.frame(surveys)
summary (object = surveys)

#both of the above are same

surveys[,1] #This tells R you want all the data in the first column
surveys[1,] #this tells R that we want the first row of data in all the columns

head(surveys [,1])
head (surveys[1])
#both of the above are pulling the same data

#we can also use the colon to pull segments of data

surveys [1:10,]


#the c function here is also useful if we want to pull specific bits of non-sequential information - see below

surveys[c(1,6,7), c(1, 2, 5)]

#the negative feature can be used to exclude data when pulling

surveys[,-1]

#in this case, it pulled everything but the first row

#to know more about excluding when pulling frames of data, look at week 3.4 around the 16:30 mark

library(tidyverse)

t_surveys <- read_csv("data/portal_data_joined.csv")
t_surveys

#note how the read_csv fuction presents the data in a tibble that is vastly different looking than read.csv but know that a tibble is also a data.frame

#--------------------------

#dollar sign operator ($) in R to create and access variables in lists and data frames.
#the summary function is used to summary is a generic function used to produce result summaries of the results of various model fitting functions. 

#---------------------------

#week 4, we start to see how to operate in tidyverse. The key thing to keep in mind when working in tidyverse is when we read csv, we don't read.csv, but rather read_csv

#understanding data manipulation

#dplyr is great for data table manipulations 
#tidyr can help us switch between data formats

library(tidyverse)

surveys <- read_csv("data/portal_data_joined.csv")

#typing in view in the console displays the entire data. one can also use the str command to get a better sense of the what the data looks like

#selecting columns

month_day_year <- select(surveys, month, day, year)
month_day_year

#the select feature allows you to select bits of the data. How do we select a specific rows from a selected set of columns?

month_day_year1 <- select(surveys, month, day, year, 11)
month_day_year1

#above, adding a number only selected the 11th item in columns, not a selected row



#the filter command allows us to filter specifics from our data. below is an example of filtering by equals

filter1 <- filter(surveys, year == 1981)
filter1

#filtering by range

filter2 <- filter(surveys, year %in% c(1981:1983))

#IMPORTANT: here we use the %in% function which is also called the bucket search function. It filters for rows in a data frame that contain certain values:

#below is an example from Statology 

##define data frame
df <- data.frame(team=c('A', 'A', 'B', 'B', 'B', 'C'),
                 points=c(67, 72, 77, 89, 84, 97),
                 assists=c(14, 16, 12, 22, 25, 20))

#view data frame
df

# team points assists 
#1    A     67      14
#2    A     72      16
#3    B     77      12
#4    B     89      22
#5    B     84      25
#6    C     97      20 

#produce new data frame that only contains rows where team is 'B'
df_new <- df[df$team %in% c('B'), ]
df_new

#team points assists
#3    B     77      12
#4    B     89      22
#5    B     84      25

#produce new data frame that only contains rows where team is 'B' or 'C'
df_new2 <- df[df$team %in% c('B', 'C'), ]
df_new2

#team points assists
#3    B     77      12
#4    B     89      22
#5    B     84      25
#6    C     97      20

# IMP: %in% can also be used to create a new row, column of data. For more info on that and how to use if_else or to understand its logical structure, go to: https://www.statology.org/in-operator-in-r/

#but the next big question is why the c function doesn't work

filter3 <- filter(surveys, year == c(1981, 1982, 1983))

# IMP the reason this doesn't work is it starts recycling data and filtering it based on whether or not a specific row matches, 1981, 1982, 1983 in sequence and one-by-one, but not all together as a bucket

#filtering by multiple conditions

condition1 <- filter(surveys, hindfoot_length > 40 & !is.na(weight)) 

#IMP: note the use of & here to make it a logical and argument

#this works at filtering all the data that is greater than 40 in hindfoot length, and no data with na values is present

#question: why did we not have to surveys$hindfoot_length?

condition1_test <- filter(surveys, surveys$hindfoot_length > 40 & !is.na(weight)) 

#this also works, but why it isn't a requirement is still not clear to me. However, this seems like the clearest way for me to continue filtering data within a given data set (surveys in this case)

#IMP using nested functions exanple

small_animals <- filter(surveys, weight <5)

Small_animals_id <- select(small_animals, plot_id, record_id, species_id)

#what we did above was we went and filtered surveys, and then selected our three variables which is complex, and easier way to do it would be nested functioning. 

nested <- select(filter(surveys, weight <5), plot_id, record_id, species_id)

#nested gives us the same results as small_animals_id

# IMP: Piping!! this function only works in tidyverse. in tidyverse, the piping function is essentially %>%, but in base r it is |>

piping1 <- filter(surveys, weight <5) %>%
  select(plot_id, record_id, species_id)

#note how this is the same as what we did above without the pipe and yields the same result

#a cleaner way to pipe is by avoiding nested functions altogether

piping2 <- surveys %>%
  filter(weight <5) %>%
  select(plot_id, record_id, species_id)

#see, cleaner, and easier to understand

#IMP mutate: used to create new columns of data in our data

surveys1 <- surveys %>%
  mutate(weight_kg = weight/1000)

str(surveys1)

#note how it adds another column with weight in kg

surveys1 <- surveys %>%
  mutate(weight_kg = weight/1000,
         weight_kg2 = weight_kg*2)

#we can also add multiple rows in one command

surveys1 <- surveys %>%
  filter(!is.na(weight)) %>%
  mutate(weight_kg = weight/1000,
         weight_kg2 = weight_kg*2)

str(surveys1)  

