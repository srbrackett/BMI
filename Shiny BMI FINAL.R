library(shiny)

ui <- shinyUI(pageWithSidebar(
  headerPanel("Calculate your Body Mass Index (BMI)"),
  sidebarPanel(
    numericInput('ht', 'Enter your height in inches', 70, min = 48, max = 80, step = .5),
    numericInput('wt', 'Enter your weight in pounds', 150, min = 50, max = 700, step = 1)
  ),
  mainPanel(
    h3('Results'),
    h4('Your height is:'),
    verbatimTextOutput("oht"),
    h4('Your weight is:'),
    verbatimTextOutput("owt"),
    h4('Your BMI is:'),
    verbatimTextOutput("prediction"),
    h6(em('Prediction'))
  )
))


BMI <- function(height,weight){
  return(0.45455*weight/(.0254*height)^2)
}

server <- shinyServer(
  function(input, output) {
    output$oht <- renderPrint({input$ht})
    output$owt <- renderPrint({input$wt})
    output$prediction <- renderPrint({BMI(input$ht, input$wt)})
  }
)

shinyApp(ui, server)

