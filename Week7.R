library (tidyverse)
library(ggplot2)

#section 1: Plot best Practices and GGPlot Review
#ggplot has 4 parts


ggplot(diamonds, aes(x= carat, y=price)) +
  geom_point()


ggplot(diamonds, aes(x= carat, y=price, color= clarity)) +
  geom_point(alpha=0.2) + theme_classic()


ggplot(diamonds, aes(x= carat, y=price, color= clarity)) +
  geom_point(alpha=0.2) + theme_classic() +
  ggtitle("Price by Diamond") + ylab('price in $') +
  stat_smooth(method= "lm")



ggplot(diamonds, aes(x= carat, y=price, color= clarity)) +
  geom_point(alpha=0.2) + theme_classic() +
  ggtitle("Price by Diamond") + ylab('price in $') +
  stat_smooth(method= "loess")

library("RColorBrewer")

display.brewer.all(colorblindFriendly = TRUE)

ggplot(diamonds, aes(x= carat, y=price, color= clarity)) +
  geom_point(alpha=0.2) + theme_classic() +
  scale_color_viridis_b(option = "C", direction = -1)

rlang::last_trace()


ggplot(diamonds, aes(x= carat, y=price, color= color, fill=color)) +
  geom_boxplot(alpha=0.2) + theme_classic() +
  ggtitle("Diamond Quality by Cut") + 
  scale_fill_viridis_d("colour")

library(ggplot2)
ggplot(diamonds, aes(x = clarity, fill = cut)) + 
  geom_bar() +
  theme(axis.text.x = element_text(angle=70, vjust=0.5)) +
  scale_fill_viridis_d(option = "C") +
  theme_classic()

barplot <- ggplot(diamonds, aes(x = clarity, fill = cut)) + 
  geom_bar() +
  theme(axis.text.x = element_text(angle=70, vjust=0.5)) +
  scale_fill_viridis_d(option = "C") +
  theme_classic()

barplot
