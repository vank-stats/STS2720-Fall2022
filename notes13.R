# Notes 13 code

# Load necessary packages

library(infer)


#########
# Single proportion example

# Read in data

mice <- read.csv("https://raw.githubusercontent.com/vank-stats/STS2720-Fall2022/main/mice.csv")


# Step 1: Determine our hypotheses (not in R)


# Step 2: Summarize our data

mice_phat <- mice %>%
  specify(drugresist ~ NULL, success = "Yes") %>%
  calculate(stat = "prop")
mice_phat


# Step 3: Generate a null distribution

set.seed(16335)
mice_null <- mice %>%
  specify(drugresist ~ NULL, success = "Yes") %>%
  hypothesize(null = "point", p = 0.25) %>%
  generate(reps = 1000, type = "draw") %>%
  calculate(stat = "prop")
visualize(mice_null) +
  shade_p_value(obs_stat = mice_phat, direction = "left")

get_p_value(mice_null, obs_stat = mice_phat, direction = "left")


# Step 4: Conclusion (not in R)



#########
# Difference in proportions example

# Load libraries

library(readr)
library(dplyr)
library(infer)

# Read in data

ACA_survey <- read_delim("https://www.openintro.org/data/tab-delimited/healthcare_law_survey.txt", 
                         "\t", escape_double = FALSE, trim_ws = TRUE) %>%
  mutate(response = ifelse(response == "approve", "approve", "dont"))


# Step 1: Set up our hypotheses (not in R)


# Step 2: Summarize our data

aca_phatdiff <- ACA_survey %>%
  specify(response ~ order, success = "approve") %>%
  calculate(stat = "diff in props", order = c("cannot_afford_second",
                                              "penalty_second"))
aca_phatdiff


# Step 3: Create a null distribution and calculate a p-value

set.seed(3110)
ACA_null <- ACA_survey %>%
  specify(formula = response ~ order, success = "approve") %>%
  hypothesize(null = "independence") %>%
  generate(reps = 1000, type = "permute") %>%
  calculate(stat = "diff in props", order = c("cannot_afford_second",
                                              "penalty_second"))
visualize(ACA_null) +
  shade_p_value(obs_stat = aca_phatdiff, direction = "both")
get_p_value(ACA_null, obs_stat = aca_phatdiff, direction = "both")


# Step 4: Reach our conclusion

# Our p-value of essentially 0 is well below our significance level, so we 
#  reject the null hypothesis. There is very strong evidence of a difference
#  in population proportion of people who approve of the individual mandate
#  based on which of our two statements is read second.