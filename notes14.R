# Notes 14 Code

library(ggplot2)
library(infer)


# Hypothesis test for a population mean

# Step 1: Hypotheses (in notes)

# Step 2: Gather and summarize data

bodytemps <- data.frame(temperature = c(97.39, 97.45, 97.96, 97.35, 96.74, 99.66,
                                        98.21, 99.02, 96.78, 97.70, 96.90, 97.29,
                                        97.99, 97.73, 98.18, 97.78, 97.17, 97.34,
                                        97.56, 98.13, 97.77, 97.07, 97.13, 96.74, 
                                        99.10, 96.76, 96.19, 97.84, 96.80, 98.09))

ggplot(bodytemps) +
  geom_histogram(aes(x = temperature), color = "white", binwidth = 0.5, 
                 boundary = 98)

temp_xbar <- bodytemps %>%
  specify(temperature ~ NULL) %>%
  calculate(stat = "mean")
temp_xbar

# Step 3: Compare our data to H0 (p-value)

set.seed(201015)
temp_null <- bodytemps %>%
  specify(formula = temperature ~ NULL) %>%
  hypothesize(null = "point", mu = 98.6) %>%
  generate(reps = 1000, type = "bootstrap") %>%
  calculate(stat = "mean")

visualize(temp_null) +
  shade_pvalue(obs_stat = temp_xbar, direction = "both")

get_pvalue(temp_null, obs_stat = temp_xbar, direction = "both")

# We got a p-value of 0, which says that in our 1,000 samples from a world
#   where the null hypothesis is true, we never once saw a sample mean as
#   far away from 98.6 as the sample mean in our actual sample. This suggests
#   our data is NOT very compatible with a population mean temperature of 98.6.


# A 95% confidence interval

temp_boot <- bodytemps %>%
  specify(temperature ~ NULL) %>%
  generate(reps = 1000, type = "bootstrap") %>%
  calculate(stat = "mean")
get_ci(temp_boot, type = "percentile", level = 0.95)




# Hypothesis test for a difference in means

# Step 1: Set up hypotheses (in notes)

# Step 2: Gather and summarize our data

esp <- read.csv("https://raw.githubusercontent.com/vank-stats/STS2720-Fall2022/main/esp.csv")

esp_diffinxbar <- esp %>%
  specify(Matches ~ Group) %>%
  calculate(stat = "diff in means", order = c("believer", "skeptic"))
esp_diffinxbar

ggplot(esp) +
  geom_boxplot(aes(x = Matches, y = Group))

# Our two groups look VERY similar, so we should expect to see a big p-value
#   because this data fits with a world where there is no difference in 
#   population means


# Step 3: Compare our data to H0 (p-value)

esp_null <- esp %>%
  specify(Matches ~ Group) %>%
  hypothesize(null = "independence") %>%
  generate(reps = 1000, type = "permute") %>%
  calculate(stat = "diff in means", order = c("believer", "skeptic"))
visualize(esp_null) +
  shade_pvalue(obs_stat = esp_diffinxbar, direction = "right")

esp_null %>%
  get_pvalue(obs_stat = esp_diffinxbar, direction = "right")

# Step 4: Reach a conclusion (in notes)



# Bonus question
# Hint: Think about if 100 people tested if a coin was "fair"

coin <- data.frame(side = rep(c("heads", "tails"), 50))
coin_null <- coin %>%
  specify(side ~ NULL, success = "heads") %>%
  hypothesize(null = "point", p = 0.5) %>%
  generate(reps = 1000, type = "draw") %>%
  calculate(stat = "prop")
visualize(coin_null)
