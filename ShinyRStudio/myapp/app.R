library(shiny)
ui <- fluidPage(
  titlePanel("Hello World!"),
  sidebarLayout(
    sidebarPanel(
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 5,
                  max = 50,
                  value = 30)
      
    ),
    mainPanel(
      plotOutput(outputId = "distPlot")
      
    )
  )
)
server <- function(input, output) {
  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#007bc2", border = "orange",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
}
shinyApp(ui, server)

runExample("02_text")
runExample("11_timer")      
runExample("07_widgets")  
