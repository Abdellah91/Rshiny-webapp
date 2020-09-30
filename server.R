shinyServer(
function(input, output, session) {
    output$myPlot <- renderPlot({
      
      disType <- input$Distribution
      size <- input$sampleSize
      if(disType == "Normal"){
        randomVec <- rnorm(size, mean=replaceNA(as.numeric(na.exclude(input$Mean))),
                           sd=replaceNA(as.numeric(input$sd)))
        
      } else {
        randomVec <- rexp(size, rate=1/ replaceNA(as.numeric(input$Lambda)))
      }
      hist(randomVec, col = input$color)
      
    })
    
    
}


)

replaceNA   <- function(x) {
  if (is.na(x)) { 
    return (1)
  } else {
    return (x)
  }
}