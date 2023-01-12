library(shiny)
library(shinyWidgets)
setwd("/home/zaneta/Pobrane/SEMESTR_I_STOPNIA_II/WprowadzenieR/ShinyRStudio/census-app")
library(shinydashboard)
source("helpers.R")
ui <- fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with 
               information from the 2010 US Census."),
      
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = list("Percent White", 
                                 "Percent Black",
                                 "Percent Hispanic", 
                                 "Percent Asian"),
                  selected = "Percent White"),
      
      sliderInput("range", 
                  label = "Range of interest:",
                  min = 0, max = 100, value = c(0, 100))
    ),
    
    mainPanel(textOutput("selected_var"))))

server <- function(input, output) {
  output$selected_var <- renderText({ 
    paste("You have selected", input$var)
  })
  output$min_max <- renderText({ 
    paste("You have chosen a range that goes from",
          input$range[1], "to", input$range[2])
  })
}

shinyApp(ui, server)





counties <- readRDS("census-app/data/counties.rds")

ui <- fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with 
        information from the 2010 US Census."),
      
      selectInput("var", 
                  label = "Choose a variable to display",
                  choices = c("Percent White", "Percent Black",
                              "Percent Hispanic", "Percent Asian"),
                  selected = "Percent White"),
      
      sliderInput("range", 
                  label = "Range of interest:",
                  min = 0, max = 100, value = c(0, 100)),
      
      selectInput("color",
                  label = "Choose a color scheme",
                  choices = c("Blue", "Red", "Green"),
                  selected = "Blues")),
    mainPanel(plotOutput("map"))))

server <- function(input, output) {
  output$map = renderPlot({
    data <- switch(input$var, 
                   "Percent White" = counties$white,
                   "Percent Black" = counties$black,
                   "Percent Hispanic" = counties$hispanic,
                   "Percent Asian" = counties$asian)
    percent_map(var = data, color = input$color, legend.title = "Title")
  })
}

shinyApp(ui, server)
getwd()
setwd("App-1")
runApp("stockVis")
