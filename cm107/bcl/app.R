library(shiny)
library(tidyverse)

bcl <- read.csv("C:/Users/Javier/OneDrive/UBC/STAT 545/STAT545_participation/cm107/bcl/bcl-data.csv", 
                stringsAsFactors = FALSE)

# Define UI for application that draws a histogram
ui <- fluidPage(
  titlePanel("BC Liquor price app", 
             windowTitle = "BCL app"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("priceInput", "Select your desired price range.",
                  min = 0, max = 100, value = c(15, 30), pre="$"),
      radioButtons("typeInput", "Select you alcoholic beverage type.",
                   choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
                   selected = "WINE")
    ),
    mainPanel(
      plotOutput("price_hist"),
      tableOutput("price_table")
    )
  )
)

# Define server logic required to draw a histogram
server <- function(input, output) {
  observe(print(input$priceInput))
  bcl_filtered <- reactive({bcl %>%
    filter(Price < input$priceInput[2],
           Price > input$priceInput[1],
           Type == input$typeInput)
    })
  output$price_hist <- renderPlot({
     bcl_filtered() %>%
      ggplot(aes(Price)) +
      geom_histogram()
  })
  output$price_table <- renderTable({
    bcl_filtered()
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

