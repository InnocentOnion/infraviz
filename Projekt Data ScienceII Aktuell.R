#Laden Excel-Paket und anschließender Datensatz

library(readxl)
library(dplyr)  

Cedric = "/Users/cedric/Dropbox/Data Science II/All_data"
Georg=

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
Fitnessstudios_und_Sportplätze<- read_excel("/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II Backup/Sportplätze und Fitnessstudios/Sportplaetze-und-Fitnessstudios-in-Deutschland.xlsx",na="NA")
Fitnessstudios_und_Sportplätze <- Fitnessstudios_und_Sportplätze %>% mutate(Latitude = Latitude %>% gsub(",", ".", .) %>% as.numeric())
Fitnessstudios_und_Sportplätze <- Fitnessstudios_und_Sportplätze %>% mutate(Longitude = Longitude %>% gsub(",", ".", .) %>% as.numeric())

# Garten und Parks laden
Garten_und_Parks <- read_excel("/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II/Parks und Gärten/Parks und Gärten in Deutschland.xlsx",na="NA")
Garten_und_Parks <- Garten_und_Parks %>% mutate(Latitude = Latitude %>% gsub(",", ".", .) %>% as.numeric())
Garten_und_Parks <- Garten_und_Parks %>% mutate(Longitude = Longitude %>% gsub(",", ".", .) %>% as.numeric())

# Polizeistationen laden
Polizeistationen <- read_excel("/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II Backup/Polizeidienststellen/Polizeidienststellen-in-Deutschland.xlsx",na="NA")
Polizeistationen <- Polizeistationen %>% mutate(Latitude = Latitude %>% gsub(",", ".", .) %>% as.numeric())
Polizeistationen <- Polizeistationen %>% mutate(Longitude = Longitude %>% gsub(",", ".", .) %>% as.numeric())

# Feuerwehrstationen laden
Feuerwehrstationen <- read_excel("/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II Backup/Feuerwehren- und Feuerwehrhäuser/Feuerwehren-und-Feuerwehrhaeuser-in-Deutschland.xlsx",na="NA")
Feuerwehrstationen <- Feuerwehrstationen %>% mutate(Latitude = Latitude %>% gsub(",", ".", .) %>% as.numeric())
Feuerwehrstationen <- Feuerwehrstationen %>% mutate(Longitude = Longitude %>% gsub(",", ".", .) %>% as.numeric())

# Krankenhäuser laden
Krankenhauser_und_Kliniken <- read.csv("/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II Backup/Krankenhäuser und Kliniken/Krankenhaeuser-und-Kliniken-in-Deutschland.csv",na="NA",sep=";",dec=",") %>% select(-Phone)

# Schulen laden
Schulen <- read.csv("/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II/Schulen/schulen.csv", na="NA", sep=",")

#DB Bahnhöfe laden
DBBahnhofe.csv <- read.csv("/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II Backup/DB Bahnhöfe/D_Bahnhof_2020_alle.csv",na="NA",sep=";",dec=",")

#Bushaltestellen laden
Bushaltestellen <- data.xls <- read_excel("/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II Backup/ÖPNV Einzeldateien/Bushaltestellen-in-Deutschland.xlsx") 
Bushaltestellen <- Bushaltestellen %>% mutate(Latitude = Latitude %>% gsub(",", ".", .) %>% as.numeric())
Bushaltestellen <- Bushaltestellen %>% mutate(Longitude = Longitude %>% gsub(",", ".", .) %>% as.numeric())

#ÖPNV Haltestellen laden
OPNV_Haltestellen <- data.xls <- read_excel("/Users/georgwamsler/Dropbox (Privat)/Universität/9.Semester/Data Science II Backup/ÖPNV/2 [alle Haltestellen]/20211203_zHV_gesamt/zHV_aktuell_csv.2021-12-03.xlsx",na="NA") 
OPNV_Haltestellen <- filter(OPNV_Haltestellen, Type == 'S' & State != 'OutOfOrder') 
OPNV_Haltestellen <- OPNV_Haltestellen %>% select(-Parent,-DHID,-SeqNo,-MunicipalityCode,-Municipality,-DistrictCode,-District,-Description,-DelfiName,-TariffDHID,-TariffName)
