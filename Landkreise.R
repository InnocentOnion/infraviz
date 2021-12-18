library(sp)
library(rgdal)
library(data.table)
library(ggplot2)

landkreise = readOGR(dsn = "/Users/georgwamsler/Desktop/nuts5000_12-31.gk3.shape/nuts5000", layer = "5000_NUTS3")

plot(landkreise)
