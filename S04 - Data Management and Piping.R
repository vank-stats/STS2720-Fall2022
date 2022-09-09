# Activity 4 solutions

# First we need to make sure the bridges.csv file is in the same folder as
# this R Script. Then go to 
# Session --> Set Working Directory --> To Source File Location
# After that you can run the code below

# If you haven't installed the dplyr package yet (or if you're using 
# AppsAnywhere), you will need to use install.packages("dplyr"). Otherwise,
# just load the library like below.

library(dplyr)


# Question 1

round(mean(c(3, 4, 6)), digits = 2)


# Question 2

c(3, 4, 6) %>%
  mean() %>%
  round(digits = 2)


# Question 3 code

diamonds_expensive <- filter(diamonds, price > 2000)
diamonds_good <- filter(diamonds, cut == "Good")
diamonds_small <- filter(diamonds, x < 5, y < 5, z < 5)
diamonds_best <- filter(diamonds, cut == "Ideal" | color == "D" | clarity == "IF")


# Question 4

summarize(diamonds, mean_ = mean(x), mean_y = mean(y), mean_z = mean(z))


# Question 5

group_by(diamonds, cut) %>%
  summarize(mean_ = mean(x), mean_y = mean(y), mean_z = mean(z))


# Question 6 code

group_by(diamonds, cut, color) %>%
  summarize(mean_ = mean(x), mean_y = mean(y), mean_z = mean(z))


# Question 7 code

diamonds2 <- mutate(diamonds, volume = x * y * z, price_can = price * 1.3)


# Question 8 code

diamonds %>%
  filter(cut == "Ideal") %>%
  mutate(price_can = price * 1.3) %>%
  group_by(color) %>%
  summarize(mean_price_can = mean(price_can), med_price_can = median(price_can))

diamonds %>%
  mutate(price_1000s = price / 1000) %>%
  filter(carat > 2) %>%
  group_by(cut, color) %>%
  summarize(min_price1000s = min(price_1000s), 
            med_price1000s = median(price_1000s), 
            max_price1000s = max(price_1000s))
