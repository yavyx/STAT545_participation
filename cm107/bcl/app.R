library(shiny)
library(tidyverse)

bcl <- read.csv("C:/Users/Javier/OneDrive/UBC/STAT 545/STAT545_participation/cm107/bcl/bcl-data.csv", 
                stringsAsFactors = FALSE)

# Define UI for application that draws a histogram
ui <- fluidPage(
      titlePanel("BC Liquor price app", 
                 windowTitle = "BCL app"),
      sidebarLayout(
        sidebarPanel("This text is in the sidebar."),
        mainPanel(
            plotOutput("price_hist"),
            tableOutput("price_table")
        )
      )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    output$price_hist <- renderPlot(ggplot2::qplot(bcl$Price))
    output$price_table <- renderTable(bcl)
}

# Run the application 
shinyApp(ui = ui, server = server)

