set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2

hw2 <- na.omit(hw2)
hw2

prob1 <- hw2[hw2>=14&hw2<=39]
prob1

times3 <- prob1 * 3
times3

times10 <- times3 + 10
times10
