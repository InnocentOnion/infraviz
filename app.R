
library(shiny)
library(shinydashboard)
library(leaflet)
library(rgdal)
library(dplyr)

# Define UI for application that draws a histogram
ui <- dashboardPage(
    skin = "red",
    dashboardHeader(title = "Durchsuche deine Umgebung"))

dashboardBody(
    leafletOutput("map",width = "100%", height = "100%"))

absolutePanel(
    top = 100, left = 10, draggable = TRUE, width = "20%", style = "z-index:500; min-width: 300px;",
    textInput("geocode", "Type an address or location", placeholder = "in England, Wales or NI"),
    actionButton("go", "Find Crime!", class = "btn-primary"),
    highchartOutput("selectstat"))

# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = input$bins + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
