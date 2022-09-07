# Activity 3b Code

# 1 - Load required packages

library(ggplot2)
library(palmerpenguins)


# 2 - Determine observations and variables (multiple options)

summary(penguins)
?penguins
library(dplyr)
glimpse(penguins)
View(penguins)


# 3 - Boxplot (or you could flip x and y for vertical boxplot)

ggplot(data = penguins) +
  geom_boxplot(aes(x = flipper_length_mm, y = species))


# 4 - Describe boxplot


# 5 - Add informative labels

ggplot(data = penguins) +
  geom_boxplot(aes(x = flipper_length_mm, y = species)) +
  labs(title = "Comparing flipper length across penguin species",
       x = "Flipper length (in mm)",
       y = "Penguin Species")


# 6 - Adding fill aesthetic

ggplot(data = penguins) +
  geom_boxplot(aes(x = flipper_length_mm, y = species, fill = sex)) +
  labs(title = "Comparing flipper length across penguin species",
       x = "Flipper length (in mm)",
       y = "Penguin Species")


# 7 - Bar graph counting penguins on each island

ggplot(data = penguins) +
  geom_bar(aes(x =  island))


# 8 - Change color and outline of bars (outside aes() function) and add a theme

ggplot(data = penguins) +
  geom_bar(aes(x =  island), fill = "aquamarine", color = "coral") +
  theme_dark()


# 9 - Map species to fill instead of assigning a single fill color

ggplot(data = penguins) +
  geom_bar(aes(x =  island, fill = species)) +
  theme_dark()


# 10 - Add position = "dodge" inside geom_bar()

ggplot(data = penguins) +
  geom_bar(aes(x =  island, fill = species), position = "dodge") +
  theme_dark()


# 11 - Play around with what you've learned to make a new graph