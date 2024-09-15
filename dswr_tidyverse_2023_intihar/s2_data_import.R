rm(list = ls())
graphics.off()

library(tibble)
library(dplyr)
library(tidyr)
library(ggplot2)

diamonds <- diamonds

class(diamonds)

economics <- economics

?economics

?hflights

hflights <- hflights::hflights
class(hflights)

# 36. Create a tibble - Part 1
as_tibble(hflights)

tibble(
  v1 = 1:10,
  v2 = 10,
  v3 = v1 * v2
)

tibble(
  `*` = "star",
  ` ` = "white space",
  `3.14` = "pi number"
)

# 37 Create a tibble - part 2

library(hflights)
class(hflights)

dft <- as_tibble(hflights)
class(dft)

df <- data.frame(x = 1:10,
y = seq.Date(from = as.Date("2021-01-01"), to = as.Date("2021-01-10"), by = "day"))
df
class(df)

dft2 <- as_tibble(df)
dft2

tibble(
  v1 = seq(from =1, to = 100, by =1),
  v2 = pi,
  v3 = sqrt(v1),
  v4 = seq.Date(from = as.Date("2021-01-01"), length.out = 100, by = "day")
)

