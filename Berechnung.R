library(tidyverse)
library(sf)
library(tidygeocoder)
geo_data_raw<-read_csv("/Users/cedric/Dropbox/Data Science II/All_data/infradata_gesamt.csv")
#geometry ist CHR!

#Geodaten nach Kreise ordnen und Infrastrukturvorkommen zählen
geo_data_transformed<-geo_data_raw %>%
  group_by(NUTS_CODE) %>%
  count(type) 



pop_data<-read_excel("/Users/cedric/Dropbox/Data Science II/All_data/Bevölkerung_und_Fläche_Kreise.xlsx") 

length(geo_data_transformed$NUTS_CODE)

geo_data_full<-geo_data_transformed %>%
  inner_join(pop_data, by = c("NUTS_CODE"="NUTS3")) %>%
  group_by(type) %>%
  mutate(max(n))
head(geo_data_full)



