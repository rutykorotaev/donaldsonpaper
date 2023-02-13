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
