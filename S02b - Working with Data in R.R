# Save this script in the same folder as the file Bridges.csv
#   Then go to Session --> Set Working Directory --> To Source File Location
#   Now this code will create an object called bridges containing our data

bridges <- read.csv(file = "Bridges.csv")


# A summary of the variables in the bridges data set

summary(bridges)


# Print the oldest and newest bridges in the data

min(bridges$YEARBUILT)
max(bridges$YEARBUILT)


# Create a vector containing just the years built

year <- bridges$YEARBUILT


# We can look at specific elements in our vector using square brackets. These
#   lines look at the (i) first, (ii) second, (iii) third, (iv) first and last,
#   and (v) last years in our vector

year[1]
year[2]
year[3]
year[c(1, 13367)]
year[13367]


# This gives us a sequence of 1, 11, 21, ..., 91
#   If we use the arguments in order, we can leave to = __ and others off our
#   code. We could use the ? to see what order the arguments go in.

seq(from = 1, to = 100, by = 10)
seq(1, 100, 10)
?seq


# If we wanted the first 149 bridges, we could do this

Alamance <- bridges[seq(1, 149, 1), ]


# This is another method 

Alamance <- bridges[1:149,]


# If we only want certain variables (columns) we can use the space after the comma

Alamance <- bridges[seq(1, 149, 1), c(3, 4, 6, 7, 8)]