# Notes 15 Code

# Load required packages

library(ggplot2)
library(infer)


# Read in the data and graph it

cereal <- data.frame(design = c(rep("A", 5), rep("B", 5), 
                                rep("C", 5), rep("D", 5)),
                     sales = c(19, 17, 16, 19, 15, 12, 18, 15, 19, 11,
                               23, 20, 18, 17, 24, 27, 33, 22, 26, 20))

ggplot(cereal) +
  geom_boxplot(aes(x = design, y = sales))



# ANOVA Hypothesis Test

# Step 1: Hypotheses (in notes)

# Step 2: Summarize data

cereal_obsF <- cereal %>%
  specify(sales ~ design) %>%
  calculate(stat = "F")
cereal_obsF


# Step 3: Generate a null distribution and find a p-value

set.seed(4520)
cereal_null <- cereal %>%
  specify(sales ~ design) %>%
  hypothesize(null = "independence") %>%
  generate(reps = 1000, type = "permute") %>%
  calculate(stat = "F")
visualize(cereal_null) +
  shade_pvalue(obs_stat = cereal_obsF, direction = "right")

get_pvalue(cereal_null, obs_stat = cereal_obsF, direction = "right")

visualize(cereal_null, method = "both", bins = 30) +
  shade_p_value(obs_stat = cereal_obsF, direction = "right")


# Step 4: Conclusion (in notes)



# Bonus: Simultaneous confidence intervals

# To compare all four package designs to every other design, we need to make 
#   6 intervals.

# Let's say we want to be 95% confident that ALL six intervals contain the true 
#   parameter. We can take our significance level (0.05) divided by the number
#   of intervals (6) to get a new significance level of 0.0083.

alpha_star <- 0.05 / 6
alpha_star

# If I make six 99.167% confidence intervals, I can still be 95% confident that 
#   ALL six intervals contain the true parameter.

(1 - alpha_star)^6

