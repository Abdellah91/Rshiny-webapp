shinyUI(
  pageWithSidebar(
    headerPanel("pageWithSidebar shiny webapp"),
    
    sidebarPanel(
      selectInput("Distribution", "Please select a distribution type",
                  choices = c("Normal", "Exponential")),
      sliderInput("sampleSize", "please select sample size: ",
                  min = 100, max= 5000, value= 1000, step= 100),
      conditionalPanel(condition = "input.Distribution == 'Normal'",
        textInput("Mean", "Please select the mean", 10),
        textInput("sd", "Please select standard Diviation",1)
      ),
      
      conditionalPanel(condition = "input.Distribution == 'Exponential'",
        textInput("Lambda", "Please select Exponenetial Lambda:", 1)
    ),
      selectInput("color", "Please select the color of the histogram",
                choices = c("blue", "green", "red", "black")
      )
    ),
    
    mainPanel(plotOutput("myPlot")
              
    )
    
    )
)