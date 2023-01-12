# Ponizszy kod tworzy aplikacje z widgetem, który pozwala uzytkownikowi wybrac zakres danych,
# na podstawie ktorych wyswietlony bedzie wykres oraz drugi, ktory pozwoli ustawic liczbe obserwacji
# kod oparty jest na bazowej wiedzy uzyskanej z tutorialu (laboratorium) oraz z wykorzystaniem informacji
# ktore zostaly znalezione w Internecie.

library(shiny)
ui<-fluidPage(
  
  titlePanel("przykladowa aplikacja"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Wybierz zestaw danych:",
                  c("Miesiące" = "month",
                    "Dni tygodnia" = "weekday")),
      sliderInput("obs", "Ilość obserwacji:",
                  min = 0, max = 8000, value = 800)
    ),
    
    mainPanel(
      plotOutput("plot")
    )
  )
)
server<-function(input, output) {
  
  datasetInput <- reactive({
    if (input$dataset == "month") {
      data <- data.frame(month = month.name, 
                         sales = sample(100:200, 12, replace = TRUE))
    } else {
      data <- data.frame(weekday = weekdays(as.Date("2022-01-01")), 
                         sales = sample(100:200, 7, replace = TRUE))
    }
    data
  })
  
  output$plot <- renderPlot({
    data <- datasetInput()
    barplot(data$sales, names.arg = data[,1], xlab = "", ylab = "Sprzedaż produktu")
  })
  
}
shinyApp(ui, server)

