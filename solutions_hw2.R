# STS2720 HW2 -- Solutions

# Note: You will need to install this package first if you haven't yet
library(ggplots)


# 1 - Recreate the graph

ggplot(midwest) +
  geom_boxplot(aes(x = area, y = state, fill = state), color = "white") +
  theme_dark() +
  labs(y = "State of County",
       x = "Area of County",
       fill = "Five States",
       title = "Comparing County Areas Across Midwest States",
       caption = "Created by <Put your name here>")


# 2 - Histogram of college education percentages

ggplot(midwest) +
  geom_histogram(aes(x = percollege), binwidth = 5, color = "white")


# 3 - Analyzing txhousing with pipe operator

txhousing %>%
  filter(city == "Dallas") %>%
  mutate(mean_sale = volume / sales) %>%
  group_by(year) %>%
  summarize(min = min(mean_sale), max = max(mean_sale))
