# This produces the numbers from 1 to 91 counting by 10s

seq(from = 1, to = 100, by = 10)


# Brings up the help menu for the seq() function

?seq


# Produces a vector of the numbers 1 through 10

seq(from = 1, to = 10, by = 1)


# Stores the previous vector in an object called myseq

myseq <- seq(from = 1, to = 10, by = 1)


# Print myseq, then print myseq divided by two, then create a vector called
#   myseq2 that contains myseq divided by two

myseq
myseq / 2
myseq2 <- myseq / 2


# This gives us an error because there are no objects with these names in our
#   environment panel

c(apple, banana, carrot)


# This prints a vector these three food names

c("apple", "banana", "carrot")


# Create a vector called myfoods with three character elements in it

myfoods <- c("massaman curry", "coconut rice", "tacos")


# Get a summary of the CO2 dataset, then view all the concentration values,
#   then view all of the uptake values

summary(CO2)
CO2$conc
CO2$uptake