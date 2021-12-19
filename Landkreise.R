library(sp)
library(rgdal)

library(ggplot2)
library(sf)


landkreise = readOGR(dsn = "/Users/cedric/Dropbox/Data Science II/All_data/nuts5000_12-31.gk3.shape/nuts5000", layer = "5000_NUTS3")

plot(landkreise)
?readOGR

landkreise2<-st_read(dsn = "/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II/All_data/DEU_adm", layer = "DEU_adm2")

landkreise3<-st_read(dsn = "/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II/All_data/DEU_adm", layer = "DEU_adm3")

plot(landkreise3)

geodata_infra<-st_as_sf(Apotheken, coords = c("Longitude", "Latitude"))

st_crs(geodata_infra)<-4326
pnts_trans <- st_transform(geodata_infra, 2163)
pnts_trans
lk_trans<-st_transform(landkreise2, 2163)
lk_trans


lk_trans<-lk_trans %>%
  select(NAME_2, ID_2, geometry)
apo_join<-st_join(pnts_trans, lk_trans, join = st_within)
apo_count<-count(as_tibble(apo_join), NAME_2) %>% print()
as_tibble(apo_join)


