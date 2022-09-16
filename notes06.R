# Notes 06 Code

# Load packages for this set of notes

library(ggplot2)
library(dplyr)
library(Lock5Data)


# Create object called cars based on data from Lock5Data pacakge

cars <- Cars2015 %>%
  select(HwyMPG, Length, Height, Acc060, Weight)


# Create graphs comparing four variables to HwyMPG

g <- ggplot(cars, aes(y = HwyMPG))
g + geom_point(aes(x = Length)) + theme_classic()
g + geom_point(aes(x = Height)) + theme_classic()
g + geom_point(aes(x = Acc060)) + theme_classic()
g + geom_point(aes(x = Weight)) + theme_classic()


# Calculate multiple linear regression equation

lm(HwyMPG ~ Length + Height + Acc060 + Weight, data = cars)


# We noticed the slope for length is different from the direction in the graph.
#   In a simple linear regression it matches the graph. We talked about why
#   this is in the notes.

lm(HwyMPG ~ Length, data = cars)


# If you store the output from lm(), you can use the predict() function
#   to make predictions using your equation. Here I predicted the HwyMPG
#   for two cars that only differed by one pound in weight.

cars.lm <- lm(HwyMPG ~ Length + Height + Acc060 + Weight, data = cars)
predict(cars.lm, newdata = data.frame(Length = c(192, 192), Height = c(72, 72), 
                                      Acc060 = c(7.7, 7.7),
                                      Weight = c(4505, 4506)))


# We can add predicted values for each observation in our data as well

cars$predictedHwyMPG <- predict(cars.lm)


# This graph shows the actual HwyMPG vs. the predicted HwyMPG (discussed in notes)

ggplot(cars) +
  geom_point(aes(x = HwyMPG, y = predictedHwyMPG)) +
  geom_abline(slope = 1, intercept = 0) +
  labs(title = "Actual vs. Predicted MPG", x = "Actual Highway MPG", 
       y = "Predicted Highway MPG") +
  geom_smooth(aes(x = HwyMPG, y = predictedHwyMPG), se = FALSE) +
  ylim(c(15, 45))
