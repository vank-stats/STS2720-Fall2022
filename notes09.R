# Notes 09 Code

# Load packages for this set of notes

library(infer)
library(dplyr)
library(ggplot2)
library(palmerpenguins)


# Re-take my sample of 30 representatives from the House

set.seed(82720)
house_of_reps <- read.csv("https://raw.githubusercontent.com/vank-stats/STS2720-Fall2022/main/house_of_reps.csv")
HOR_samp <- rep_sample_n(house_of_reps, size = 30)

# Calculate my sample proportion

HOR_phat <- mean(HOR_samp$party == "Democratic")
HOR_phat


# Use the infer package to do 1,000 bootstrap resamples and calculate a sample 
#   proportion for each of them. 

HOR_boot <- HOR_samp %>%
  specify(formula = party ~ NULL, success = "Democratic") %>%
  generate(reps = 1000, type = "bootstrap") %>%
  calculate(stat = "prop")

visualize(HOR_boot)


# 95% confidence intervals using percentile method and the SE method

get_ci(HOR_boot, type = "percentile", level = 0.95)
get_ci(HOR_boot, type = "se", level = 0.95, point_estimate = HOR_phat)



# Confidence intervals for differences in population proportions

# Remove Adelie penguins so I can compare the other two speciesi

peng_samp <- filter(penguins, species != "Adelie", !is.na(sex))


# Find the sample proportion of penguins that are female for each species

table(peng_samp$species, peng_samp$sex) %>%
  prop.table(margin = 1)


# Create a bootstrap distribution of 1000 differences in sample proprotions
#   using resampling then visualize the results with a histogram

peng_bootstrap <- peng_samp %>%
  specify(formula = sex ~ species, success = "female") %>%
  generate(reps = 1000, type = "bootstrap") %>%
  calculate(stat = "diff in props", order = c("Chinstrap", "Gentoo"))
visualize(peng_bootstrap)

# Find a 95% confidence interval using the percentile method (the default if 
#   I leave out level = __)

get_ci(peng_bootstrap, type = "percentile")
