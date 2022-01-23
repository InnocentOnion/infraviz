library(tidyverse)
library(tidygeocoder)
library(sf)
library(shiny)
library(shinydashboard)
#library(ggmap)
library(broom)
library(rgdal)

geo_data_merged<-read_csv("/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II/All_data/geo_data_merged.csv")
lk<-readOGR(dsn = "/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II/All_data/nuts5000_12-31.gk3.shape/nuts5000", layer = "5000_NUTS3")
landkreise3<-st_read(dsn = "//Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II/All_data/nuts5000_12-31.gk3.shape/nuts5000", layer = "5000_NUTS3")
k_trans <- st_transform(landkreise3, 2163) %>%
  select(NUTS_CODE, NUTS_NAME, geometry)

geo_data_tidy<-tidy(lk) #
lk$id<-row.names(lk)
geo_data_tidy2 <- left_join(geo_data_tidy, lk@data)