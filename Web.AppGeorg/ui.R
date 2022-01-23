header <- dashboardHeader(title = "infra")

sidebar <- dashboardSidebar(
    sidebarMenu(
<<<<<<< Updated upstream
        menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
        menuItem("Widgets", icon = icon("th"), tabName = "widgets"),
        textInput("adresse", label = h3("Landkreis Analyse"), value = "Witten"),
                         actionButton("los", "Adresse berechnen")
=======
        menuItem("Karte", tabName = "Karte"),
        menuItem("InfraRank", tabName = "InfrakRank")
           
      
>>>>>>> Stashed changes
            
        )
    )

body <- dashboardBody(
    tabItems(
<<<<<<< Updated upstream
        tabItem(tabName = "dashboard",
                plotOutput("plot")
                ),
        tabItem(tabName = "Widgets"))
)
=======
        tabItem(tabName = "Karte",
                
                column(width = 4,
                box(width = NULL,
                    "Apotheke", br(),
                    sliderInput("slider", "Slider input:", 0, 1, 0.5),
                    
                    "Bahnhöfe", br(),
                    sliderInput("slider", "Slider input:", 0, 1, 0.5),
                    
                    "Bushaltestellen", br(),
                    sliderInput("slider", "Slider input:", 0, 1, 0.5),
                    
                    "Feuerwehrstationen", br(),
                    sliderInput("slider", "Slider input:", 0, 1, 0.5), 
                
                    "Fitnessstudio/Sportplätze", br(),
                    sliderInput("slider", "Slider input:", 0, 1, 0.5),
                    
                    "Krankenhäuser", br(),
                    sliderInput("slider", "Slider input:", 0, 1, 0.5),
                       
                    "Park", br(),
                    sliderInput("slider", "Slider input:", 0, 1, 0.5),
                            
                    "Polizeistationen", br(),
                    sliderInput("slider", "Slider input:", 0, 1, 0.5),
                                
                    "Schulen", br(),
                    sliderInput("slider", "Slider input:", 0, 1, 0.5)))),

        tabItem(tabName = "InfrakRank", 
                fluidRow(
                box(width = 12, title = "Infrastruktur",plotOutput("plot"))),
                fluidRow(
                box(width = 6, background = "light-blue",
                     textInput("adresse", label = h3("Landkreis Analyse"), value = "Witten"),
                     actionButton("los", "Adresse berechnen"))
                ))))
    
   
        


>>>>>>> Stashed changes

dashboardPage(header, sidebar, body)



