library(tidyverse)
library(sf)
library(tidygeocoder)

#Pfade anpassen
geo_data_raw<-read_csv("/Users/cedric/Dropbox/Data Science II/All_data/infradata_gesamt.csv")
#geometry ist CHR!

#Geodaten nach Kreise ordnen und Infrastrukturvorkommen zählen
geo_data_transformed<-geo_data_raw %>%
  group_by(NUTS_CODE) %>%
  count(type) 

#Populationsdaten importieren
pop_data<-read_excel("/Users/cedric/Dropbox/Data Science II/All_data/Bevölkerung_und_Fläche_Kreise.xlsx") 

#Pop-Daten und Geodaten zusammenführen + Neue SPalten hinzufügen
geo_data_full<-geo_data_transformed %>%
  inner_join(pop_data, by = c("NUTS_CODE"="NUTS3")) %>%
  select(-Schlüsselnummer, -männlich, -weiblich) %>%
  mutate(Infra_by_pop = insgesamt/n) %>%
  mutate(Infra_by_fläche = Fläche/n) %>%
  group_by(type) %>%
  mutate(min(Infra_by_pop)) %>%
  mutate(INfra_rank = (min(Infra_by_pop)/Infra_by_pop))
  
head(geo_data_full)



