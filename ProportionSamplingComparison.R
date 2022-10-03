library(moderndive)
library(ggplot2)
library(infer)
library(patchwork)

# Read in the population
house_of_reps <- data.frame(member = 1:435,
                            party = c(rep("Democratic", 220),
                                      rep("Republican", 212),
                                      rep("Vacant", 3)))

# Take a random sample

set.seed(82720)
house_of_reps <- read.csv("https://raw.githubusercontent.com/vank-stats/STS2720-Fall2022/main/house_of_reps.csv")
mysamp <- rep_sample_n(house_of_reps, size = 30)


# Take 1,000 random samples and calculate a sample proportion

manysamps <- rep_sample_n(house_of_reps, size = 30, reps = 1000) %>%
  group_by(replicate) %>%
  summarize(prop_dem = mean(party == "Democratic"))


# Take 1,000 random *resamples* from our sample and calculate p-hat

resamples <- mysamp %>%
  rep_sample_n(size = 30, replace = TRUE, reps = 1000) %>%
  group_by(replicate) %>%
  summarize(prop_dems = mean(party == "Democratic"))


# Graph all four

pop_graph <- ggplot(house_of_reps) +
  geom_bar(aes(x = party), fill = "orange") +
  labs(title = "Distribution of Population")

samp_graph <- ggplot(mysamp) +
  geom_bar(aes(x = party), fill = "purple") +
  labs(title = "Distribution of Single Sample")

samp_dist_graph <- ggplot(manysamps) +
  geom_histogram(aes(x = prop_dem), color = "white", binwidth = 1/30) +
  labs(title = "Sampling Distribution") +
  xlim(c(.2, .8)) +
  geom_vline(xintercept = 220 / 435, color = "orange", size = 2) +
  geom_vline(xintercept = 14 / 30, color = "purple", size = 2)

boot_graph <- ggplot(resamples) +
  geom_histogram(aes(x = prop_dems), color = "white", binwidth = 1/30) +
  labs(title = "Bootstrap Resampling Distribution") +
  xlim(c(.2, .8)) +
  geom_vline(xintercept = 220 / 435, color = "orange", size = 2) +
  geom_vline(xintercept = 14 / 30, color = "purple", size = 2)

(pop_graph + samp_dist_graph) / (samp_graph + boot_graph)