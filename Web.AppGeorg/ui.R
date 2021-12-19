header <- dashboardHeader(title = "infra")

sidebar <- dashboardSidebar(
    sidebarMenu(
        menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
        menuItem("Widgets", icon = icon("th"), tabName = "widgets"),
        textInput("adresse", label = h3("Landkreis Analyse"), value = "Witten"),
                         actionButton("los", "Adresse berechnen")
            
        )
    )

body <- dashboardBody(
    tabItems(
        tabItem(tabName = "dashboard",
                plotOutput("plot")
                ),
        tabItem(tabName = "Widgets"))
)

dashboardPage(header, sidebar, body)



