#Download dataset
data1 <-
  read.csv("inputs/rawdata.csv") %>% 
  janitor::clean_names() %>% 
  separate(col = date_mmm_yy, 
           into = c("Month", "Year"),
           sep = "-") |> 
  mutate(
    Year = paste0("20", as.numeric(Year)),
    Day = 1) |> 
  mutate(date = paste(Year, Month, Day, sep = "-")) |> 
  mutate(date = lubridate::ymd(date))

#Filter data by housing status of refugees
Housing_Status <-
  data1 |>
  filter(population_group == "Refugees") %>% 
  select(date, actively_homeless, newly_identified)

write_csv(Housing_Status, "outputs/data/Housing_Status.csv")

#Filter data by gender of refugees
Demographic_Data <-
  data1 |>
  filter(population_group == "Refugees") %>%
  select(date, gender_male, gender_female, gender_transgender_non_binary_or_two_spirit) %>% 
  pivot_longer(cols = c(gender_male, gender_female, gender_transgender_non_binary_or_two_spirit),
               names_to = "gender",
               values_to = "number") %>% 
  mutate(gender = recode(gender, 
                         gender_male = "male",
                         gender_female = "female",
                         gender_transgender_non_binary_or_two_spirit = "non_binary"
                         ))

write_csv(Demographic_Data, "outputs/data/Demographic_Status.csv")

#Filter data by age of refugees
Age_Data <-
  data1 |>
  filter(population_group == "Refugees") %>%
  select(date, ageunder16, age16_24, age25_44, age45_64, age65over) %>% 
  pivot_longer(cols = c(ageunder16, age16_24, age25_44, age45_64, age65over),
               names_to = "age",
               values_to = "number") %>% 
  mutate(ages = recode(age, 
                         ageunder16 = "Under 16",
                         age16_24 = "Aged 16 to 24",
                         age25_44 = "Aged 25 to 44",
                       age45_64 = "Aged 45 to 64",
                       age65over = "Over 65",
                    
  ))

write_csv(Demographic_Data, "outputs/data/Demographic_Status.csv")


