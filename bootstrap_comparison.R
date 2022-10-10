# Bootstrap distribution comparisons

# Distribution for a single proportion

bootstrap_dist <- data %>%
  specify(formula = response ~ NULL, success = "level") %>%
  generate(reps = 1000, type = "bootstrap") %>%
  calculate(stat = "prop")

# Distribution for a difference in proportions

bootstrap_dist <- data %>%
  specify(formula = response ~ explanatory, success = "level") %>%
  generate(reps = 1000, type = "bootstrap") %>%
  calculate(stat = "diff in props", order = c("first", "second"))

# Distribution for a single mean

bootstrap_dist <- data %>%
  specify(formula = response ~ NULL) %>%
  generate(reps = 1000, type = "bootstrap") %>%
  calculate(stat = "mean")

# Distribution for a difference in means

bootstrap_dist <- data %>%
  specify(formula = response ~ explanatory) %>%
  generate(reps = 1000, type = "bootstrap") %>%
  calculate(stat = "diff in means", order = c("first", "second"))