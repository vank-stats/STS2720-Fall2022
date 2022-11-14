# Notes 16 Code

# Hypothesis test for a proportion

prop.test(x = 59, n = 100, p = 0.5, alternative = "two.sided")


# Hypothesis test for a difference in proportions

prop.test(x = c(38, 24), n = c(50, 30), alternative = "less")


# Hypothesis test for a mean

library(palmerpenguins)
t.test(penguins$body_mass_g, mu = 4000, alternative = "greater")


# Hypothesis test for a difference in means

t.test(penguins$flipper_length_mm ~ penguins$sex, alternative = "less")


# ANOVA test

fidget <- read.csv("https://raw.githubusercontent.com/vank-stats/STS2720-Fall2022/main/fidget_spinners.csv")
fidget_anova <- aov(MemoryScore ~ Condition, data = fidget)
summary(fidget_anova)


# Chi-squared test

example <- data.frame(season = c(rep("Fall", 7), rep("Spring", 10),
                                 rep("Summer", 19), rep("Winter", 15)),
                      handedness = c("Left", rep("Right", 6),
                                     "Left", rep("Right", 9), 
                                     "Both", "Left", rep("Right", 17),
                                     "Both", rep("Left", 3), rep("Right", 11)))

chisq.test(x = example$season, y = example$handedness)
