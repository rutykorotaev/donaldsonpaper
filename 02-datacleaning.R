data <- read_csv("inputs/rawdata.csv")

data <- 
  data |>
  filter(population_group == "Refugees") %>% 
  select(actively_homeless, `date(mmm-yy)`)
