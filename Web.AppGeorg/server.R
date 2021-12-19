#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    #output$value <- renderPrint({
    #    input$adresse
    #})
    
    adresse_finden <- reactive({
        input$los
        df <- data.frame(Adresse = isolate(input$adresse))
        a_conv <- df %>%
            geocode(Adresse,
                    method = "osm",
                    lat = Latitude,
                    long = Longitude)
        a_conv_sf <-
            st_as_sf(a_conv, coords = c("Longitude", "Latitude"))
        #Projektionen zuordnen
        st_crs(a_conv_sf) <- 4326
        a_pnts <- st_transform(a_conv_sf, 2163)
        
        a_join <- st_join(a_pnts, k_trans, join = st_within)
        
        a_join
    })
    
    output$plot <- renderPlot({
        data <- adresse_finden()
        cat(data$NUTS_CODE)
        geo_data_merged %>%
            filter(NUTS_CODE == data$NUTS_CODE) %>%
            ggplot() +
            aes(x = type, y = med_relation * 100) +
            geom_bar(stat = "identity") +
            labs(
                title = "Infrastruktur im Verhältnis zum deutschen Median",
                x = "Infrastrukturkategorie",
                y = "Prozentuale Abweichung vom Median",
                caption = "Quelle: Internet"
            )
     })
    
    })
