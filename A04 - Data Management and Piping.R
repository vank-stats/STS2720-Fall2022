# This is a template for Activity 4's code

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



# Question 4

summarize(diamonds, __ = __, __ = __, __ = __)


# Question 5

group_by(__, __) %>%
  summarize(diamonds, __ = __, __ = __, __ = __)


# Question 6 code



# Question 7 code


# Question 8 code

