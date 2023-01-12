library(shiny)
ui <- fluidPage(
  titlePanel("My Shiny App"),
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      img(src = "rstudio.png", height = 140, width = 400)
    )
  )
)

server <- function(input, output) {
}
shinyApp(ui=ui, server=server)

# actionButton("action", label = "Action")

getwd()
