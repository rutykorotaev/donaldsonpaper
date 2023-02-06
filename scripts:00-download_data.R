library(opendatatoronto)
library(dplyr)

#Get package
package <- show_package("ac77f532-f18b-427c-905c-4ae87ce69c93")
package

#Get all resources for this package
resources <- list_package_resources("ac77f532-f18b-427c-905c-4ae87ce69c93")

#Identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

#Load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
data

#Name dataset
write_csv(x = data, file = "inputs/rawdata.csv")

