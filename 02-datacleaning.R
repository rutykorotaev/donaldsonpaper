#Download dataset
data1 <- read.csv("inputs/rawdata.csv")

#Filter data by housing status of refugees
Housing_Status <-
  data1 |>
  filter(population_group == "Refugees") %>% 
  select(date.mmm.yy., actively_homeless, newly_identified, moved_to_housing, became_inactive, returned_from_housing)

#Filter data by gender and age of refugees
Demographic_Data <-
  data |>
  filter(population_group == "Refugees") %>%
  select(`date(mmm-yy)`, 'ageunder16', 'age16-24', 'age25-44', 'age45-64', 'age65over', 'gender_male', 'gender_female', 'gender_transgender,non-binary_or_two_spirit')
