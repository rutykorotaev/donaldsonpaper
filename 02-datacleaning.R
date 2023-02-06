#Download dataset
data1 <- read.csv("inputs/rawdata.csv")

#Filter data by housing status of refugees
Housing_Status <-
  data1 |>
  filter(population_group == "Refugees") %>% 
  select(date.mmm.yy., actively_homeless, newly_identified, moved_to_housing, became_inactive, returned_from_housing)

#Filter data by gender and age of refugees
Demographic_Data1 <-
  data |>
  filter(population_group == "Refugees") %>%
  select(`date(mmm-yy)`, 'ageunder16', 'age16-24', 'age25-44', 'age45-64', 'age65over', 'gender_male', 'gender_female', 'gender_transgender,non-binary_or_two_spirit')

#Filter to create percentage of how many refugees are male, female, non-binary per year
Refugees_total <- Demographic_Data$gender_male + Demographic_Data$gender_female + Demographic_Data$`gender_transgender,non-binary_or_two_spirit`
dates <- Demographic_Data$`date(mmm-yy)`
percentage_male <- Demographic_Data1$gender_male/Demographic_Data1$Refugees_total
percentage_female <- Demographic_Data1$gender_female/Demographic_Data1$Refugees_total
percentage_nonbinary <- Demographic_Data$`gender_transgender,non-binary_or_two_spirit`/Demographic_Data1$Refugees_total
