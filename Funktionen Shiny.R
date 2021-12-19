library(tidyverse)
library(tidygeocoder)
library(sf)

adresse_finden<-function(a){
  df<-data.frame(Adresse = (a))
  a_conv<-df %>%
    geocode(Adresse, method = "osm", lat = Latitude, long = Longitude)
  return(a_conv)
}
G<-adresse_finden("Oberstraße 59, Witten")