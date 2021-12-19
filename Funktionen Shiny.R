library(tidyverse)
library(tidygeocoder)
library(sf)

landkreise3<-st_read(dsn = "/Users/cedric/Dropbox/Data Science II/All_data/nuts5000_12-31.gk3.shape/nuts5000", layer = "5000_NUTS3")
k_trans<-st_transform(landkreise3, 2163) %>%
  select(NUTS_CODE, NUTS_NAME, geometry)

adresse_finden <- reactive({
  df<-data.frame(Adresse = input$adresse)
  a_conv<-df %>%
    geocode(Adresse, method = "osm", lat = Latitude, long = Longitude)
  a_conv_sf<-st_as_sf(a_conv, coords = c("Longitude", "Latitude"))
  #Projektionen zuordnen
  st_crs(a_conv_sf)<-4326
  a_pnts <- st_transform(a_conv_sf, 2163)
  
  a_join<-st_join(a_pnts, k_trans, join = st_within)
  
  a_join
})

rank_finder<-function(b){
  c<-geo_data_full %>%
    filter(NUTS_CODE == b$NUTS_CODE)
  c
}

output$
plot_rank<-function(c){
  d<-ggplot(c) +
    aes(x = type, y = med_relation * 100) +
    geom_bar(stat = "identity") +
    labs(title = "Infrastruktur im Verhältnis zum deutschen Median", x = "Infrastrukturkategorie", y = "Prozentuale Abweichung vom Median", caption = "Quelle: Internet") 
  d
}

