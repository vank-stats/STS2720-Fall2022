# Exam 3 Review
#   Covers Notes/Activities 12 - 16 (plus special activity 3)

library(infer)

# Example with p-value > significance level
#   Activity 15B - seasons vs. handedness

# Read in data

example <- data.frame(season = c(rep("Fall", 7), rep("Spring", 10),
                                 rep("Summer", 19), rep("Winter", 15)),
                      handedness = c("Left", rep("Right", 6),
                                     "Left", rep("Right", 9), 
                                     "Both", "Left", rep("Right", 17),
                                     "Both", rep("Left", 3), rep("Right", 11)))

table(example$season, example$handedness)

# Calculate a test statistic

example_chisq <- example %>%
  specify(formula = season ~ handedness) %>%
  calculate(stat = "Chisq")
example_chisq

# Null distribution

set.seed(2468)
example_null <- example %>%
  specify(formula = season ~ handedness) %>%
  hypothesize(null = "independence") %>%
  generate(reps = 1000, type = "permute") %>%
  calculate(stat = "Chisq")
visualize(example_null) +
  shade_pvalue(obs_stat = example_chisq, direction = "right")

get_pvalue(example_null, obs_stat = example_chisq, direction = "right")


# Conclusion

# Since my p-value is bigger than 0.05, we fail to reject the null hypothesis.
#   There is insufficient evidence to claim that there is a relationship
#   between the hand someone uses and the season they were born in.

# Even with a p-value above our significance level, we are not saying that the
#   the null hypothesis is true. We are saying our data fits with a world
#   where the null is true, but it might also fit with a world where something
#   else is true. In other words, we never "accept the null", we only fail to
#   reject it.



### P-value direction

# Typically it depends on the symbol in your alternative hypothesis.
#   If Ha has a > sign, direction = "right"
#   If Ha has a < sign, direction = "left"
#   If Ha has a not equals sign, direction = "both"
#   ANOVA and Chi-Squared tests always use direction = "right"

#  If you're doing a test for a difference in means or proportions, be careful
#    to make sure you keep group 1 and group 2 the same when planning your
#    hypotheses and when writing your code.



### Chi-squared vs. ANOVA test (Notes/Activities 15)

# ANOVA test is to compare population means across multiple groups.
#   This means we have a quantitative response and categorical explanatory.

# Chi-squared test is to look for a relationship between two categorical
#   variables. It doesn't matter which is the response and which is explanatory.