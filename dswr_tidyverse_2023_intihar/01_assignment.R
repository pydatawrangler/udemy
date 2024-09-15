
rm(list = ls())

graphics.off()

library(dplyr)
library(tidyr)
library(ggplot2)
library(hflights)

df <- hflights

df %>% nrow(); df %>% ncol()

df %>% 
  select(Origin, Dest) %>% 
  distinct() %>% 
  pivot_longer(cols = everything(),
               names_to = "origin/dest",
               values_to = "airport") %>% 
  distinct(airport) %>% 
  arrange(airport)

df %>% 
  filter(Cancelled == 1) %>% 
  nrow()

carrier.stats <- df %>% 
  group_by(UniqueCarrier) %>% 
  summarise(flights = n(),
             `total distance flown (miles)` = sum(Distance),
             `total ActualElapsedTime (h)` = round(sum(ActualElapsedTime, na.rm = TRUE)/60, 1),
             `total AirTime (h)` = round(sum(AirTime, na.rm = TRUE)/60, 1),
             `mean distance flown (miles)` = mean(Distance),
            `total ActualElapsedTime (h)` = round(mean(ActualElapsedTime, na.rm = TRUE)/60, 1),
            `total AirTime (h)` = round(mean(AirTime, na.rm = TRUE)/60, 1),
             )

carrier.stats %>% 
  select(UniqueCarrier,
         distance = `total distance flown (miles)`) %>% 
  arrange(desc(distance)) %>% 
  mutate(rank = row_number(),
         group = case_when(rank <= 3 ~ "top performer",
                           .default = "the rest")) %>% 
  group_by(group) %>% 
  summarise(carriers = n(),
            distance = sum(distance)) %>% 
  ungroup() %>% 
  mutate(`distance %` = distance / sum(distance) * 100) %>% 
  arrange(desc(distance))

library(stringr)
library(lubridate)
library(ggplot2)

df <- df %>% 
  mutate(year = Year,
         month = Month,
         dayofmonth = DayofMonth) %>% 
  mutate_at(.vars = c("Month", "DayofMonth"),
            .funs = str_pad, 2, "left", 0) %>% 
  unite(col = 'date', Year, Month, DayofMonth, sep = '-') %>% 
  mutate(date = lubridate::ymd(date)) %>% 
  mutate(quarter = quarter(date),
         week = isoweek(date)) %>% 
  select(date, year, month, dayofmonth, quarter, week, DayOfWeek, everything())

df %>% 
  group_by(quarter) %>% 
  summarise(flights = n()) %>% 
  ungroup() %>% 
  mutate(`delta flights` = flights - lag(flights, 1),
         quarter = as.factor(quarter)) %>% 
  ggplot(aes(x = quarter, y = `delta flights`)) +
  geom_col()

df %>% 
  group_by(month) %>% 
  summarise(distance = sum(Distance)) %>% 
  ungroup() %>% 
  mutate(`delta distance` = distance - lag(distance, 1),
         month = as.factor(month)) %>% 
  ggplot(aes(x = month, y = `delta distance`)) +
  geom_col()

df %>% 
  select(carrier = UniqueCarrier,
         month) %>% 
  group_by(carrier, month) %>% 
  summarise (flights = n()) %>% 
  ungroup() %>% 
  mutate(`max flights` = max(flights),
         `flights normalized` = flights / `max flights`) %>% 
  select(carrier, month, `flights normalized`) %>% 
  pivot_wider(names_from = month,
              values_from = `flights normalized`,
              values_fill = 0)

df %>% 
  select(carrier = UniqueCarrier,
         month) %>% 
  group_by(carrier, month) %>% 
  summarise (flights = n()) %>% 
  ungroup() %>% 
  mutate(`max flights` = max(flights),
         `flights normalized` = flights / `max flights`) %>% 
  select(carrier, month, `flights normalized`) %>% 
  mutate(month = as.factor(month)) %>% 
  ggplot(aes(x = carrier,
             y = month,
             fill = `flights normalized`)) +
  geom_tile() +
  scale_fill_viridis_c(option = "magma") +
  theme_minimal()

df <- hflights

df <- df %>% 
  mutate(year = Year,
         month = Month,
         dayofmonth = DayofMonth) %>% 
  mutate(across(.cols = c("Month", "DayofMonth"),
            .fns = str_pad, 2, "left", 0)) %>% 
  unite(col = 'date', Year, Month, DayofMonth, sep = '-') %>% 
  mutate(date = lubridate::ymd(date)) %>% 
  mutate(quarter = quarter(date),
         week = isoweek(date)) %>% 
  select(date, year, month, dayofmonth, quarter, week, DayOfWeek, everything())
  