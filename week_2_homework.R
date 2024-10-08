set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2

hw2 <- na.omit(hw2)
hw2

#the omit function lets you omit certain values from your set of things.

prob1 <- hw2[hw2>=14&hw2<=39]
prob1

#remember to select the vector which you want to run these fucntions on. Without a selected vector, R will just give you true or false values for the thing you input. 

times3 <- prob1 * 3
times3

plus10 <- times3 + 10
plus10

final <- plus10[c(TRUE, FALSE)]
final

#is there a way to find a to find alternate values in a set?