# This is a template for Activity 03a's code

# First we need to make sure the bridges.csv file is in the same folder as
# this R Script. Then go to 
# Session --> Set Working Directory --> To Source File Location
# After that you can run the code below

bridges <- read.csv(file = "bridges.csv")


# If you haven't installed the ggplot2 package yet (or if you're using 
# AppsAnywhere), you will need to use install.packages("ggplot2"). Otherwise,
# just load the library like below.

library(ggplot2)


# Question 3 - Creates a blank gray square

ggplot(data = bridges)


# Question 4 - Creates a scatter plot with year on x and SR on y

ggplot(data = bridges) +
  geom_point(aes(x = YEARBUILT, y = SR))


## Question 5 - Creates a histogram of years built

ggplot(data = bridges) +
  geom_histogram(aes(x = YEARBUILT))


## Question 7 - Adds lines around the bars to make them easier to see

ggplot(data = bridges) +
  geom_histogram(aes(x = YEARBUILT), color = "white")


## Question 8 - Changes the bars to be 10 years wide. The second graph shifts
#     the bars so that they represent decades instead of something like
#     1995 - 2005.

ggplot(data = bridges) +
  geom_histogram(aes(x = YEARBUILT), color = "white", binwidth = 10)

ggplot(data = bridges) +
  geom_histogram(aes(x = YEARBUILT), color = "white", binwidth = 10, 
                 boundary = 2000)


## Question 9 - Creates a histogram of structural ratings with 20 bars. The
#     color of the lines and fill of the bars has been changed.

ggplot(data = bridges) +
  geom_histogram(aes(x = SR), color = "lightblue", fill = "gray", bins = 20)
