# Notes 04 Code

# Functions in this set of notes are in the dplyr package

library(dplyr)


### Piping (%>%) examples

# filter to include only automatic cars, group by number of cylinders,
#   summarize mean mpg for each number of cylinders

auto_avg_by_cyl <- mtcars %>%
  filter(am == 0) %>%
  group_by(cyl) %>%
  summarize(mean_mpg = mean(mpg))
auto_avg_by_cyl



### filter() examples
# Create a dataset called auto that only includes automatic transmissions
#   from the mtcars dataset

auto <- filter(mtcars, am == 0)


# Create a dataset with only 4 cylinder automatic transmissions

auto4 <- filter(mtcars, am == 0, cyl == 4)

# another option

auto4 <- filter(mtcars, am == 0 & cyl == 4)


#  Filter practice questions

lowmileage <- filter(mtcars, mpg < 20)
lowmpg_man <- filter(mtcars, am == 1, mpg < 20)
man_or_highhp <- filter(mtcars, am == 1 | hp > 150)



### summarize() and group_by() functions

summarize(mtcars, Minimum = min(mpg), Q1 = quantile(mpg, .25), 
          Median = median(mpg), Q3 = quantile(mpg, .75), Maximum = max(mpg))

summarize(mtcars, Min_mpg = min(mpg), Q1_mpg = quantile(mpg, .25), 
          Med_mpg = median(mpg), Q3_mpg = quantile(mpg, .75), Max_mpg = max(mpg))


# Summary above but grouped by transmission type (am variable)

group_by(mtcars, am) %>%
  summarize(Minimum = min(mpg), Q1 = quantile(mpg, .25), 
            Median = median(mpg), Q3 = quantile(mpg, .75), Maximum = max(mpg))

# Practice questions

mtcars %>%
  group_by(cyl) %>%
  summarize(Mean_mpg = mean(mpg), Med_mpg = median(mpg))

mtcars %>%
  group_by(am, cyl) %>%
  summarize(Mean_mpg = mean(mpg), Med_mpg = median(mpg))




#### mutate() section

# Create new objects called mycars
#   Calculate a variable called weight, that is wt times 1000

mycars <- mutate(mtcars, weight = wt * 1000)

# Practice question

mycars <- mutate(mtcars, disp_cm = 16.387 * disp)


# If I want BOTH of my new variables in my dataset
# Option 1

mycars <- mutate(mtcars, weight = wt * 1000)
mycars <- mutate(mycars, disp_cm = 16.387 * disp)

# Option 2

mycars <- mutate(mtcars, weight = wt * 1000, 
                 disp_cm = 16.387 * disp)

# Option 3

mycars <- mtcars %>%
  mutate(weight = wt * 1000) %>%
  mutate(disp_cm = 16.387 * disp)