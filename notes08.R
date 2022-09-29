# Notes 08 Code

# Load packages for notes 08

library(moderndive)
library(ggplot2)
library(dplyr)


# Take a single sample from my population

set.seed(82720)
house_of_reps <- read.csv("https://raw.githubusercontent.com/vank-stats/STS2720-Fall2022/main/house_of_reps.csv")
mysamp <- rep_sample_n(house_of_reps, size = 30)
mysamp
table(mysamp$party)


# Take a single *re*-sample from my sample (with replacement)

mysamp2 <- rep_sample_n(mysamp, size = 30, replace = TRUE)
mysamp2
table(mysamp2$party)


# See what happens if I do other resamples from my observed sample

mysamp3 <- rep_sample_n(mysamp, size = 30, replace = TRUE)
mysamp3
table(mysamp3$party)

mysamp4 <- rep_sample_n(mysamp, size = 30, replace = TRUE)
mysamp4
table(mysamp4$party)

mysamp5 <- rep_sample_n(mysamp, size = 30, replace = TRUE)
mysamp5
table(mysamp5$party)


# Each resample looked a bit different. Let's do a BUNCH of these.
# Take 1000 resamples from my sample and calculate p-hat for each

resamples <- mysamp %>%
  rep_sample_n(size = 30, replace = TRUE, reps = 1000) %>%
  group_by(replicate) %>%
  summarize(prop_dems = mean(party == "Democratic"))

ggplot(data = resamples) +
  geom_histogram(aes(x = prop_dems), binwidth = 1 / 30, color = "white")


