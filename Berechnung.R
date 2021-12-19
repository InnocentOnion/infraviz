library(tidyverse)
library(sf)
library(tidygeocoder)

#Pfade anpassen
geo_data_raw<-read_csv("/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II/All_data/infradata_gesamt.csv")
#geometry ist CHR!

#Geodaten nach Kreise ordnen und Infrastrukturvorkommen zählen
geo_data_transformed<-geo_data_raw %>%
  group_by(NUTS_CODE) %>%
  count(type) 

#Populationsdaten importieren
pop_data<-read_excel("//Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II/All_data/Bevölkerung_und_Fläche_Kreise.xlsx") 

#Pop-Daten und Geodaten zusammenführen + Neue SPalten hinzufügen
geo_data_full<-geo_data_transformed %>%
  inner_join(pop_data, by = c("NUTS_CODE"="NUTS3")) %>%
  select(-Schlüsselnummer, -männlich, -weiblich) %>%
  mutate(pop_by_infra = n/insgesamt) %>%
  mutate(fläche_by_infra = n/Fläche) %>%
  group_by(type) %>%
  mutate(median(pop_by_infra)) %>%
  mutate(Infra_rank = (pop_by_infra/median(pop_by_infra)))%>%
  mutate(med_relation = (Infra_rank-1))
  
  
head(geo_data_full)
write_csv(geo_data_full,"/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II/All_data/geo_data_merged.csv")


