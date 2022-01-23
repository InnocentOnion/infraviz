library(tidyverse)
library(tidygeocoder)
library(sf)

#Einlesen der Daten zu Landkreisen als Geo-Daten-Objekt
landkreise3<-st_read(dsn = "/Users/cedric/Dropbox/Data Science II/All_data/nuts5000_12-31.gk3.shape/nuts5000", layer = "5000_NUTS3")
k_trans<-st_transform(landkreise3, 2163) %>%
  select(NUTS_CODE, NUTS_NAME, geometry)

######################
#"geo_data_full" in der Funktion "rank_finder" wird nicht importiert
#müsste "geo_data_merged.csv" entsprechen
#Import einfügen
#Muss überhaupt hier importiert werden? Eventuell reicht Import in global.R
######################

#Definieren einer Funktion, um die im Dashboard eingegebene Adresse einem Landkreis zuzuordnen
adresse_finden <- reactive({
  df<-data.frame(Adresse = input$adresse) #Die Adresse wird aus dem Input in der Shiny-App gezogen
  a_conv<-df %>%
    geocode(Adresse, method = "osm", lat = Latitude, long = Longitude) #Längen und Breitengrad für Adresse wird gefunden
  a_conv_sf<-st_as_sf(a_conv, coords = c("Longitude", "Latitude")) #Transformation in Geo-Funktion lesbare Längen und Breitengrade
  #Projektionen zuordnen
  st_crs(a_conv_sf)<-4326
  a_pnts <- st_transform(a_conv_sf, 2163)
  
  a_join<-st_join(a_pnts, k_trans, join = st_within) #Join der Adressdaten aus Input und Datei zu Landkreisen
  
  a_join
})

#Funktion um aus Datensatz mit Infra-Rank den Rank des Landkreises zu finden, in dem die eingegebene Adresse liegt
rank_finder<-function(b){
  c<-geo_data_full %>%
    filter(NUTS_CODE == b$NUTS_CODE)
  c
}

#Funktion, um den Infrarank der eingegebenen Adresse grafisch darzustellen
plot_rank<-function(c){
  d<-ggplot(c) +
    aes(x = type, y = med_relation * 100) +
    geom_bar(stat = "identity") +
    labs(title = "Infrastruktur im Verhältnis zum deutschen Median", x = "Infrastrukturkategorie", y = "Prozentuale Abweichung vom Median", caption = "Quelle: Internet") 
  d
}

#Funktion, die jeder Kategorie Gewichtung zuweist
rank_generator<-function(a,b,c,d,e,f,g,h,i){
  tribble(
    ~type, ~weight,
    "Apotheke", a,
    "Bahnhof", b,
    "Bushaltestelle", c,
    "Feuerwehrstation", d,
    "Fitnessstudio/Sportplatz", e,
    "Krankenhaus", f,
    "Park", g,
    "Polizeistation", h,
    "Schule", i
    
  )
}
#Funktion, die Gewichtung nach Landkreis aggregiert
weight_generator<-function(data){
  inner_join(geo_data_merged, data, by = "type") %>%
    mutate(weighted_rank = weight*Infra_rank) %>%
    group_by(NUTS_CODE, Kreise) %>%
    summarise(full_rank = sum(weighted_rank))
}
