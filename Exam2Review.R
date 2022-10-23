# Exam 2 Review

# Resampling using penguins data

library(palmerpenguins)
library(ggplot2)
library(infer)

ggplot(penguins) +
  geom_histogram(aes(x = body_mass_g), color = "white")


# Come up with an estimate of the pop. mean body mass

# Option 1 to find sample mean
xbar1 <- mean(penguins$body_mass_g, na.rm = TRUE)

# Option 2 to find sample mean (using infer)
xbar2 <- specify(penguins, body_mass_g ~ NULL) %>%
  calculate(stat = "mean")


# Create a bootstrap distribution of sample means

penguin_boot <- penguins %>%
  specify(body_mass_g ~ NULL) %>%
  generate(reps = 1000, type = "bootstrap") %>%
  calculate(stat = "mean")
visualize(penguin_boot)


# Calculate a 90% CI for pop. mean penguin mass

get_ci(penguin_boot, level = .9, type = "percentile")
get_ci(penguin_boot, level = .9, type = "se", point_estimate = xbar1)


# Interpret: I am 90% confident the population mean penguin mass is between
#   4131 and 4272 grams.