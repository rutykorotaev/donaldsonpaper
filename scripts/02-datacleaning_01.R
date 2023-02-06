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

### Debris ####

#Add year column to Demographic Data
year <- rep(c(2018,2019,2020,2021,2022),each = 12)
Year_Demographic <- cbind(year, Demographic_Data)

#Add year column to Housing Status Data
year1 <- rep(c(2018, 2019, 2020, 2021, 2022), each = 12)
Year_Housing <- cbind(year, Housing_Status)

#Create total number of refugees per gender
Total_Male <- sum(Demographic_Data$gender_male)
Total_Female <- sum(Demographic_Data$gender_female)
Total_Nonbinary <- sum(Demographic_Data$`gender_transgender,non-binary_or_two_spirit`)



#test 
Male_Refugees_by_year <- Year_Demographic %>% group_by(year)%>% tally(sum(gender_male))
Female_Refugees_by_year <- Year_Demographic %>% group_by(year) %>% tally(sum(gender_female))
Nonbinary_Refugees_by_year <- Year_Demographic %>% group_by(year) %>% tally(sum(`gender_transgender,non-binary_or_two_spirit`))

cbind(Male_Refugees_by_year, Female)
                                                               
#Number of refugees per year by gender
MaleRef2018 <- sum(Year_Demographic[which(Year_Demographic$year == "2018"),4])
FemaleRef2018 <- sum(Year_Demographic[which(Year_Demographic$year == "2018"),10])


