# Notes 12 Code

# Load packages

library(ggplot2)
library(infer)
library(dplyr)


# Read in data

layoffs <- data.frame(age = c(25, 33, 35, 38, 48, 55, 55, 55, 56, 64),
                      laidoff = c("No", "No", "No", "No", "No", 
                                  "Yes", "Yes", "No", "No", "Yes"))


# Code for graph in case you're interested

ggplot(layoffs, aes(x = laidoff, y = age)) +
  geom_boxplot(aes(fill = laidoff), show.legend = FALSE, alpha = 0.5) +
  geom_jitter(size = 2, height = 0, width = 0.1, alpha = 0.5) +
  labs(title = "Layoffs at Westvaco Corp. in 1991",
       subtitle = "Were the layoffs discriminatory based on age?",
       x = "Was employeed laid off?") +
  scale_fill_viridis_d(option = "D") +
  theme_bw()


# Step 2: Calculate a difference in sample means

obs_xbardiff <- layoffs %>%
  specify(age ~ laidoff) %>%
  calculate(stat = "diff in means", order = c("Yes", "No"))
obs_xbardiff


# Step 3: Using the infer package to generate a null distribution

set.seed(201005)
layoff_perm <- layoffs %>%
  specify(formula = age ~ laidoff) %>%
  hypothesize(null = "independence") %>%
  generate(reps = 1000, type = "permute") %>%
  calculate(stat = "diff in means", order = c("Yes", "No"))

visualize(layoff_perm) +
  shade_pvalue(obs_stat = obs_xbardiff, direction = "right")


# Step 4: Calculating our p-value

get_pvalue(layoff_perm, obs_stat = obs_xbardiff, direction = "right")
