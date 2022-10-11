# Notes 11 Code

library(dplyr)
library(palmerpenguins)


# CI for a population proportion (female penguins)

table(penguins$sex)
prop.test(x = 165, n = 165 + 168, conf.level = .95)

# 95% CI: (0.44, 0.55) --- p-hat = 0.495



# CI for a difference in pop. proportions (compare proportion female for 
#   Chinstrap - Gentoo)

table(penguins$sex, penguins$species)
prop.test(x = c(34, 58), n = c(34 + 34, 58 + 61), conf.level = 0.95)

# 95% CI: (-0.15, 0.17)



# CI for a population mean (pop. mean bill length)

t.test(penguins$bill_length_mm, conf.level = 0.95)

# 95% CI: (43.34, 44.50) --- x-bar = 43.92



# CI for a difference in means (bill lengths between Chinstrap and Gentoo penguins)

penguins_twospecies <- filter(penguins, species != "Adelie")
t.test(penguins_twospecies$bill_length_mm ~ penguins_twospecies$species, conf.level = 0.95)

# 95% CI: (0.36, 2.30) -- xbar1 = 48.83 and xbar2 = 47.50