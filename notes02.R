# Code from beginning Notes 2

mynumbers <- c(4, 8, 15, 16, 23, 42)
mynumbers * 2
max(mynumbers)


# Practice questions - change second line so third produces 84
# As usual, there are multiple ways to do this

mynumbers <- c(4, 8, 15, 16, 23, 42)
mynumbers <- mynumbers * 2
max(mynumbers)


# Practice questions

mynums <- c(1, 2, 5, 10)
mynums * 3
max(mynums)
min(mynums)


# Two different ways to see an error (Max shouldn't be capitalized in first,
# and numbers is misspelled in the second)

Max(mynumbers)
max(mynumbres)


# Two ways to open the help menu for the mtcars dataset

?mtcars
help(mtcars)


# We can also get information about functions this way

?c
help(max)


# Three ways to explore a dataset. See the notes for how they differ

head(mtcars)
summary(mtcars)
View(mtcars)


# The glimpse function is in the dplyr package, so we need to load the package
# Remember that you may need to install a package (in the console window) if you
# haven't done that before.

library(dplyr)
glimpse(mtcars)


# The skim function is in the skimr package. This function gives another summary

library(skimr)
skim(mtcars)


# If we only want a certain column in our data, we can use the $ operator

mtcars$hp


# Practice questions

mtcars$wt
min(mtcars$mpg)


# Bonus question

max(Loblolly$age)
min(Loblolly$height)
