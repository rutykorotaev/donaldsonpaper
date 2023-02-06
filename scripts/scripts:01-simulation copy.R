#Initiate random number generator
set.seed(7)
library(tidyverse)

#Simulate dataset by month and number of refugees
tibble(
  month = 1:12, 
  number_homeless_refugees = runif(n = 12, min = 100, max = 1000))

#Graph simulated data
df <- data.frame(Months = 1:12, Refugees = number_homeless_refugees)
number_homeless_refugees |>
  ggplot(mapping = aes(x = month, y = number_homeless_refugees)) +
  geom_point()+
  geom_line()


