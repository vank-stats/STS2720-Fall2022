# STS2720 HW1 -- Solutions

# Note: You will need to install this package first if you haven't yet
library(moderndive)


# Question 2 - There are 325 observations and 13 variables. There are multiple
#     ways to find this information. Below are three of them.

?amazon_books

library(dplyr)
glimpse(amazon_books)

View(amazon_books)



# Question 3 - Books in this data were published between 1936 and 2011. There
#     multiple ways to find this, but you 'll need the min and max of the 
#     pub_year variable in the amazon_books data frame.

summary(amazon_books$pub_year)



# Question 4 - Emily Bronte. I know there are 325 observations, so I am using
#     square brackets to choose the last observation in the author variable.

amazon_books$author[325]



# Question 5 - 14 of the 325 books have fewer than 100 pages.

sort(amazon_books$num_pages)



# Question 6a - The data frame has an underscore in it: amazon_books

aggregate(num_pages ~ hard_paper, data = amazonbooks, FUN = mean)


# Question 6b - Add corrected code below

aggregate(num_pages ~ hard_paper, data = amazon_books, FUN = mean)


# Question 6c - It is calculating the mean number of pages for both paperback
#     and hard cover books (333.5 and 342.2 respectively)



# Question 7 - There are tons of possible options for this question.


