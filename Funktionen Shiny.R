library(tidyverse)
library(tidygeocoder)
library(sf)

landkreise3<-st_read(dsn = "/Users/cedric/Dropbox/Data Science II/All_data/nuts5000_12-31.gk3.shape/nuts5000", layer = "5000_NUTS3")
k_trans<-st_transform(landkreise3, 2163) %>%
  select(NUTS_CODE, NUTS_NAME, geometry)

adresse_finden<-function(a){
  df<-data.frame(Adresse = (a))
  a_conv<-df %>%
    geocode(Adresse, method = "osm", lat = Latitude, long = Longitude)
a_conv_sf<-st_as_sf(a_conv, coords = c("Longitude", "Latitude"))
  #Projektionen zuordnen
st_crs(a_conv_sf)<-4326
a_pnts <- st_transform(a_conv_sf, 2163)

a_join<-st_join(a_pnts, k_trans, join = st_within)
  
return(a_join)
}
G<-adresse_finden("Oberstraße 59, Witten")