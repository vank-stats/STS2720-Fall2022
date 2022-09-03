# Load the ggplot2 library to make graphs

library(ggplot2)


# Create the first graph in the notes

ggplot(data = mtcars) +
  geom_point(aes(x = wt, y = mpg))


# Practice questions 2/3

ggplot(data = mtcars) +
  geom_point(aes(x = hp, y = mpg))

ggplot(data = mtcars) +
  geom_bar(aes(x = am))


# Histogram practice

ggplot(data = airquality) +
  geom_histogram(aes(x = Temp))


# Make our histogram look a little better

ggplot(data = airquality) +
  geom_histogram(aes(x = Temp), bins = 20, color = "white")


# Boxplots

# Toothgrowth dataset boxplot from notes
# You can also flip the bars to be horizontal by changing x/y

ggplot(data = ToothGrowth) +
  geom_boxplot(aes(x = supp, y = len))

ggplot(data = ToothGrowth) +
  geom_boxplot(aes(x = len, y = supp))


# Remember we can look up info about datasets built into R

?ToothGrowth


# Bar graphs

# Recreate diamond cut graph in notes
# Use geom_bar because we have raw data where each row represents a single diamond

?diamonds
head(diamonds)

ggplot(diamonds) +
  geom_bar(aes(x = cut))


# Graph from notes using labs() function to change labels
#   I added the classic theme to it.

ggplot(diamonds) +
  geom_point(aes(x = carat, y = price, color = cut), alpha = .2) +
  labs(title = "Scatterplot of diamond prices",
       subtitle = "Using diamonds dataset from ggplot2",
       caption = "Created for STS2720 (Fall 2022)",
       x = "Weight of the Diamond (in carats)",
       y = "Price in US Dollars",
       color = "Quality of Cut") +
  theme_classic()