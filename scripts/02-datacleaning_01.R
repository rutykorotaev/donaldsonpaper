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

#Filter data by gender and age of refugees
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


