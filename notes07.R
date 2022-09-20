# Notes 07 Code

# R package for our textbook

library(moderndive)


# Read in my population to sample from, generate a sample of 30 people, 
#  and look at the breakdown of political parties in my sample

house_of_reps <- read.csv("https://raw.githubusercontent.com/vank-stats/STS2720-Fall2022/main/house_of_reps.csv")
mysamp <- rep_sample_n(house_of_reps, size = 30)
table(mysamp$party)


# Take 100 samples of 30 people. Group by replicate (sample), and calculate
#   a sample proportion for each sample.

library(dplyr)

manysamps <- rep_sample_n(house_of_reps, size = 30, reps = 100) %>%
  group_by(replicate) %>%
  summarize(prop_dem = mean(party == "Democratic"))


# Calculate the population proportion

true_p <- mean(house_of_reps$party == "Democratic")


# Make a histogram of my 100 sample proportions with population proportion in blue

library(ggplot2)
ggplot(manysamps) +
  geom_histogram(aes(x = prop_dem), color = "white", binwidth = 1/30) +
  geom_vline(xintercept = true_p, color = "blue") +
  labs(title = "Sample proportions from 100 samples of 30 US Representatives",
       subtitle = "Blue = Population Proportion",
       x = "Proportion of Democrats in Sample",
       y = "Number of random samples")


# Take 100 samples of 200 people and calculate the sample proportion for each.
#   Then graph the sample proportions

manysamps <- rep_sample_n(house_of_reps, size = 200, reps = 100) %>%
  group_by(replicate) %>%
  summarize(prop_dem = mean(party == "Democratic"))

ggplot(manysamps) +
  geom_histogram(aes(x = prop_dem), color = "white", binwidth = 1/30) +
  geom_vline(xintercept = true_p, color = "blue") +
  labs(title = "Sample proportions from 100 samples of 200 US Representatives",
       subtitle = "Blue = Population Proportion",
       x = "Proportion of Democrats in Sample",
       y = "Number of random samples")
