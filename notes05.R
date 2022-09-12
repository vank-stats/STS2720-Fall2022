# Code for Notes 05

# Read in mask data from Activity 5a

masks <- read.csv("https://raw.githubusercontent.com/vank-stats/STS2720-Fall2022/main/masks_covid.csv")


# Simple linear regression of mask data

lm(Symptoms_Pct ~ Masks_Pct, data = masks)

# My SLR is yhat = 112.927 - 1.062 * Masks_Pct


# Predictions using R

# Create an object that contains our line formula

masks.lm <- lm(Symptoms_Pct ~ Masks_Pct, data = masks)


# Use the predict function with a new data set including the values to predict
# First line predicts a single value (x = 90)
# The second line predicts four values (x = 10, 40, 60, and 90)

predict(masks.lm, newdata = data.frame(Masks_Pct = 90))
predict(masks.lm, newdata = data.frame(Masks_Pct = c(10, 40, 60, 90)))