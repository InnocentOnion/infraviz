library(sp)
library(rgdal)
library(tidyverse)
library(ggplot2)
library(sf)
library(broom)

Spielerei = readOGR(dsn = "/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II/All_data/nuts5000_12-31.gk3.shape/nuts5000", layer = "5000_NUTS3")
Spielerei_tidy = tidy(Spielerei)

ggplot(Spielerei_tidy, aes(x = long, y = lat, group = group)) +
  geom_polygon(color = "black", size = 0.1, fill = "lightgrey") +
  coord_equal() +
  theme_minimal()

Spielerei@data <- Spielerei@data %>% 
  add_column(runif = runif(nrow(Spielerei@data),min=1,max=100)) %>% 
 


Spielerei$id <- row.names(Spielerei)
Spielerei_tidy <- left_join(Spielerei_tidy, Spielerei@data)

Spielerei_tidy$id <- row.names(Spielerei)
Spielerei_tidy <- left_join(Spielerei_tidy, Spielerei)

