library(leaflet)
library(dplyr)
library(shiny)

#Krankenhäuser und Kliniken laden 

Kranken <- Kranken[complete.cases(Kranken),]
Kranken$Longitude <- as.numeric(Kranken$Longitude)
Kranken$Latitude <- as.numeric(Kranken$Latitude)

Schulen <- Schulen[complete.cases(Schulen),]
Schulen$lat <- as.numeric(Schulen$lat)
Schulen$lon <- as.numeric(Schulen$lon)

Apotheken <- Apotheken[complete.cases(Apotheken),]
Apotheken$Longitude <- as.numeric(Apotheken$Longitude)
Apotheken$Latitude <- as.numeric(Apotheken$Latitude)

map <- leaflet()%>%addTiles()%>%
  addCircles(data = Kranken, lat = ~Latitude, lng = ~Longitude, popup = ~paste(Name,City,sep=", "),radius = 1) %>%
  addCircles(data = Schulen, lat = ~lat, lng = ~lon, popup = ~paste(name),radius = 1, color = '#31882A') %>%
  addCircles(data = Apotheken, lat = ~Latitude, lng = ~Longitude, popup = ~paste(Name),radius = 1, color = '#61882A')


print("hallo")
  
map



