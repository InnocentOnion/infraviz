library(sf)
#Transformation der Daten zu Infrastrukturpunkten in Geo-Programm-lesbare Daten
#Zuordnen von administrativen Bezikrne zu Infrastrukturpunkten

#Landkreise laden
landkreise3<-st_read(dsn = "/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II/All_data/nuts5000_12-31.gk3.shape/nuts5000", layer = "5000_NUTS3")
head(landkreise3)
#Daten in Haupttabelle transformieren
geodaten_gesamt<-infradata %>%
  filter(Latitude!="NA")
geodaten_gesamt<-st_as_sf(geodaten_gesamt, coords = c("Longitude", "Latitude"))
#Projektionen zuordnen
st_crs(geodaten_gesamt)<-4326
pnts_trans_all <- st_transform(geodaten_gesamt, 2163)
k_trans<-st_transform(landkreise3, 2163)
k_trans

k_trans<-k_trans %>%
  select(NUTS_NAME,NUTS_CODE, geometry)
apo_join<-st_join(pnts_trans_all, k_trans, join = st_within)

as_tibble(apo_join)
write.csv(apo_join, "/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II/All_data/infradata_gesamt.csv")
