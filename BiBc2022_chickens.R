library(tidyverse)
library(dplyr)
library(ggplot2)

#read data
data <- read.csv('Scorings.csv', header = TRUE, sep = ";")

# remove unidentified chicken and last measuring day
data_id <- data %>%
  filter(AnimalIdentifier != 0) %>%
  filter(Date != '06/09/2020')

# generate plot
ggplot(data_id, aes(x = Date, y = Weight, color = Color)) +
  geom_jitter(aes(shape = Sex), width = 0.15, size = 5) +
  labs(
    title = "Weight of chickens",
    subtitle = "Weight per chicken per type and sex over time",
    y = "Weight (g)"
  ) +
  theme_bw() +
  theme(
    plot.title = element_text(hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5)
  )