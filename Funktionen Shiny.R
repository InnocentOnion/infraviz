library(tidyverse)
library(tidygeocoder)
library(sf)

adresse_finden<-function(a){
  df<-data.frame(Adresse = (a))
  Adresse<-geocode(df, method = "osm", lat = Latitude, long = Longitude)
  return(Adresse)
}
G<-adresse_finden("Oberstraße 59, Witten")
?as.data.frame
