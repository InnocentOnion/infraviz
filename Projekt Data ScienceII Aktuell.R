#Laden Excel-Paket und anschließender Datensatz

library(readxl)
library(dplyr)  

Cedric = "/Users/cedric/Dropbox/Data Science II/All_data"
Georg = "/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II/All_data"

# Apotheken laden
Apotheken <- read_excel(paste(Cedric,"Apotheken-in-Deutschland.xlsx", sep = "/"),na="NA")
Apotheken <- Apotheken %>% 
  mutate(Latitude = Latitude %>% 
          gsub(",", ".", .) %>% 
          as.numeric()) %>%
          mutate(Longitude = Longitude %>% 
          gsub(",", ".", .) %>% as.numeric()) %>% 
          select(-`Opening hours`,-Phone)


# Fitnessstudios laden
Fitnessstudios_und_Sportplätze<- read_excel(paste(Cedric,"Sportplaetze-und-Fitnessstudios-in-Deutschland.xlsx", sep = "/"),na="NA")
Fitnessstudios_und_Sportplätze <- Fitnessstudios_und_Sportplätze %>% 
  mutate(Latitude = Latitude %>% 
  gsub(",", ".", .) %>% 
  as.numeric()) %>% 
  mutate(Longitude = Longitude %>% 
  gsub(",", ".", .) %>% as.numeric())

# Garten und Parks laden
Garten_und_Parks <- read_excel(paste(Cedric,"Parks und Gärten in Deutschland.xlsx", sep = "/"),na="NA")
Garten_und_Parks <- Garten_und_Parks %>% 
  mutate(Latitude = Latitude %>% 
  gsub(",", ".", .) %>% 
  as.numeric()) %>% 
  mutate(Longitude = Longitude %>% 
  gsub(",", ".", .) %>% 
  as.numeric())

# Polizeistationen laden
Polizeistationen <- read_excel(paste(Cedric,"Polizeidienststellen-in-Deutschland.xlsx", sep = "/"),na="NA")
Polizeistationen <- Polizeistationen %>% 
  mutate(Latitude = Latitude %>% 
  gsub(",", ".", .) %>% 
  as.numeric()) %>% 
  mutate(Longitude = Longitude %>% 
  gsub(",", ".", .) %>% 
  as.numeric())

# Feuerwehrstationen laden
Feuerwehrstationen <- read_excel(paste(Cedric,"Feuerwehren-und-Feuerwehrhaeuser-in-Deutschland.xlsx", sep = "/"),na="NA")
Feuerwehrstationen <- Feuerwehrstationen %>% mutate(Latitude = Latitude %>% gsub(",", ".", .) %>% as.numeric()) %>% 
  mutate(Longitude = Longitude %>% gsub(",", ".", .) %>% as.numeric())

# Krankenhäuser laden
Krankenhauser_und_Kliniken <- read.csv(paste(Cedric,"Krankenhaeuser-und-Kliniken-in-Deutschland.csv", sep = "/"),na="NA",sep=";",dec=",") %>%
  select(-Phone)

# Schulen laden
Schulen <- read.csv(paste(Cedric,"schulen.csv", sep = "/"), na="NA", sep=",")

#DB Bahnhöfe laden
DBBahnhofe <- read.csv(paste(Cedric,"D_Bahnhof_2020_alle.csv", sep = "/"),na="NA",sep=";",dec=",")
str(DBBahnhofe)
DBBahnhofe<-DBBahnhofe %>%
  select(Laenge, Breite, NAME) %>%
  rename(Longitude = Laenge) %>%
  rename(Latitude = Breite) 
length(DBBahnhofe$NAME)

  

#Bushaltestellen laden
Bushaltestellen <- read_excel(paste(Cedric,"Bushaltestellen-in-Deutschland.xlsx", sep = "/")) 
Bushaltestellen <- Bushaltestellen %>% 
  mutate(Latitude = Latitude %>% 
  gsub(",", ".", .) %>% 
  as.numeric()) %>% 
  mutate(Longitude = Longitude %>% gsub(",", ".", .) %>% as.numeric())
length(Bushaltestellen$Latitude)

#UBahn laden
Ubahn<-read_excel(paste(Cedric,"U-Bahn Haltestellen in Deutschland.xlsx", sep = "/"))

#ÖPNV Haltestellen laden
OPNV_Haltestellen <- read_excel(paste(Cedric,"zHV_aktuell_csv.2021-12-03.xlsx", sep = "/"),na="NA") 
OPNV_Haltestellen <- filter(OPNV_Haltestellen, Type == 'S' & State != 'OutOfOrder') %>% 
  select(-Parent,-DHID,-SeqNo,-MunicipalityCode,-Municipality,-DistrictCode,-District,-Description,-DelfiName,-TariffDHID,-TariffName)









