# Notes 10 Code

library(infer)
library(dplyr)
library(ggplot2)
library(palmerpenguins)


# Single mean example - penguin bill length

# Calculate a sample mean

peng_xbar <- mean(penguins$bill_length_mm, na.rm = TRUE)
peng_xbar

# Get rid of penguins who are missing a bill length

peng_samp <- filter(penguins, !is.na(bill_length_mm))

# Create a bootstrap distribution of 1,000 sample means (sampling with 
#   replacement from my observed sample). Visualize with a histogram.

set.seed(91920)
penguin_boot <- peng_samp %>%
  specify(formula = bill_length_mm ~ NULL) %>%
  generate(reps = 1000, type = "bootstrap") %>%
  calculate(stat = "mean")

visualize(penguin_boot)

# 95% CI using the percentile method

get_ci(penguin_boot, level = 0.95, type = "percentile")

# 95% CI using the SE method

get_ci(penguin_boot, level = 0.95, type = "se", point_estimate = peng_xbar)

# Both CIs were (43.4, 44.5)
# Interpretation: We are 95% confident the population mean bill length of
#  Antarctic penguins is between 43.4 and 44.5 mm.



# Comparing two means example

# Remove Adelie penguins so we can compare Chinstrap and Gentoo penguins

Peng_samp2 <- filter(peng_samp, species != "Adelie")

# Use infer package approach to calculate a difference in sample means

peng_diffinxbar <- Peng_samp2 %>%
  specify(formula = bill_length_mm ~ species) %>%
  calculate(stat = "diff in means", order = c("Chinstrap", "Gentoo"))
peng_diffinxbar


# Generate a bootstrap distribution of 1000 differences in sample means using
#   resampling. Visualize with a historgram.

peng_boot2 <- Peng_samp2 %>%
  specify(formula = bill_length_mm ~ species) %>%
  generate(reps = 1000, type = "bootstrap") %>% 
  calculate(stat = "diff in means", order = c("Chinstrap", "Gentoo"))
visualize(peng_boot2)

# Calculate a 90% CI (using percentile method) for the difference in population
#   mean bill lengths between our two species

get_ci(peng_boot2, type = "percentile", level = 0.9)
