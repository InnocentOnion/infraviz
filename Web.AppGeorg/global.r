library(tidyverse)
library(tidygeocoder)
library(sf)
library(shiny)
library(shinydashboard)
#library(ggmap)
library(broom)
library(rgdal)

Cedric= "/Users/cedric/Dropbox/Data Science II/All_data"
Georg = "/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II/All_data"
pfad = Cedric

geo_data_merged<-read_csv(paste(pfad,"geo_data_merged.csv", sep = "/"))
lk<-readOGR(dsn = paste(pfad,"nuts5000_12-31.gk3.shape/nuts5000", sep = "/"), layer = "5000_NUTS3")
landkreise3<-st_read(dsn = paste(pfad,"nuts5000_12-31.gk3.shape/nuts5000", sep = "/"), layer = "5000_NUTS3")
k_trans <- st_transform(landkreise3, 2163) %>%
  select(NUTS_CODE, NUTS_NAME, geometry)

geo_data_tidy<-tidy(lk) #
lk$id<-row.names(lk)
geo_data_tidy2 <- left_join(geo_data_tidy, lk@data)