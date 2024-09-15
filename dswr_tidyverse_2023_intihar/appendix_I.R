library(dplyr)
library(tidyr)
library(ggplot2)
library(tibble)
library(stringr)

mpg <- mpg

mpg %>% 
  summarize(across(.cols = everything(),
                   .fns = n_distinct))

mpg %>% 
  summarize(across(everything(),
                   n_distinct))


mpg %>% 
  summarize(across(c(displ, cty, hwy),
                   mean))

mpg %>% 
  summarize(across(where(is.numeric),
                   median))

mpg %>% 
  summarize(across(where(is.character),
                   n_distinct))

mpg %>% 
  summarise(across(where(is.numeric),
                   avgmed
                   ))

avgmed <- list(avg = ~mean(.x, na.rm = TRUE),
               med = ~median(.x, na.rm = TRUE))

mpg %>% 
  summarise(across(where(is.numeric),
                   avgmed,
                   .names = "{.fn}_{.col}"))

mpg |> 
  summarize(across(where(is.numeric) & ends_with("y"),
median))

mpg |> 
  group_by(model) |> 
  summarize(across(where(is.numeric),
sum)) |> 
  ungroup()

mpg |> 
  group_by(manufacturer, model) |> 
  summarise(across(c(displ, cty, hwy), mean)) |> 
  ungroup()

mpg |> 
  mutate(across(where(is.numeric), ~ceiling(.x)))

mpg |> 
  mutate(across(where(is.character),
~str_to_upper(.x)))

mpg |> 
  group_by(manufacturer) |> 
  mutate(across(where(is.numeric) & -year, ~mean(.x, na.rm = TRUE), .names = "{.col}_avg_manufacturer"))

starwars <- dplyr::starwars

starwars |> 
  filter(if_any(.cols = everything(),
.fns = ~ !is.na(.x)))

starwars |> 
  filter(if_all(.cols = everything(),
.fns = ~ !is.na(.x)))

mpg |> 
  filter(if_any(.cols = c(cty, hwy), ~ . > 20))

mpg |> 
  filter(if_all(.cols = c(cty, hwy), ~ . > 20))

?starwars
