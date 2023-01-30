set.seed(7)
library(tidyverse)

tibble(
  month = 1:12, 
  number_homeless_refugees = runif(n = 12, min = 100, max = 1000)
)
