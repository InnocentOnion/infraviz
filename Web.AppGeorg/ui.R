header <- dashboardHeader(title = "Infrastruktur")

sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem("Karte", tabName = "Karte"),
        menuItem("InfraRank", tabName = "InfrakRank")
           
      
            
        )
    )

body <- dashboardBody(
    tabItems(
        tabItem(tabName = "Karte",
                
                column(width = 4,
                box(width = NULL,
                  
                    "Apotheke", br(),
                        sliderInput("Apotheke", "Gewichtung", 0, 1, 0.5,),
                    
                    "Bahnhöfe", br(),
                        sliderInput("Bahnhöfe", "Gewichtung", 0, 1, 0.5),
                    
                    "Bushaltestellen", br(),
                    sliderInput("Bushaltestellen", "Gewichtung", 0, 1, 0.5),
                    
                    "Feuerwehrstationen", br(),
                    sliderInput("Feuerwehrstationen", "Gewichtung", 0, 1, 0.5), 
                
                    "Fitnessstudio/Sportplätze", br(),
                    sliderInput("Fitnessstudios", "Gewichtung", 0, 1, 0.5),
                    
                    "Krankenhäuser", br(),
                    sliderInput("Krankenhäuser", "Gewichtung", 0, 1, 0.5),
                       
                    "Park", br(),
                    sliderInput("Park", "Gewichtung", 0, 1, 0.5),
                            
                    "Polizeistationen", br(),
                    sliderInput("Polizeistationen", "Gewichtung", 0, 1, 0.5),
                                
                    "Schulen", br(),
                    sliderInput("Schulen", "Gewichtung", 0, 1, 0.5))),
              column(width = 8,
                  box(width = NULL, title = "Infrastruktur", plotOutput("map_plot", height = 735))),
                
                ),
        
    

        tabItem(tabName = "InfrakRank", 
                fluidRow(
                box(width = 12, title = "Infrastruktur", plotOutput("plot"))),
                fluidRow(
                box(width = 6, background = "light-blue",
                     textInput("adresse", label = h3("Landkreis Analyse"), value = "Witten"),
                     actionButton("los", "Adresse berechnen"))
                ))))
    
   
        


dashboardPage(header, sidebar, body)



