library(shiny)

cm5feet <- 152.4
cm1inch <- 2.54
minBMI <- 18.5
maxBMI <- 25

w <- function(height, weight, diff) {
  round(weight + diff * (height-cm5feet)/cm1inch, 1)
}

w1 <- function(sex, height) {
  w <- if(sex==1) 52 else 49
  d <- if(sex==1) 1.9 else 1.7
  w(height, w, d)
}

w2 <- function(sex, height) {
  w <- if(sex==1) 50 else 45.5
  d <- 2.3
  w(height, w, d)
}

w3 <- function(sex, height) {
  h <- height/100 * height/100
  minW <- round(h * minBMI, 1)
  maxW <- round(h * maxBMI, 1)
  c(minW, maxW)
}

shinyServer(   
  function(input, output) {
    height <- reactive({ as.numeric(input$height) })
    sex <- reactive({ as.numeric(input$sex) })
    output$w1 <- renderText({ if(height() > cm5feet) paste(w1(sex(), height()), "kg", " is your ideal weight based on the Robinson formula (1983)") else "" })
    output$w2 <- renderText({ if(height() > cm5feet) paste(w2(sex(), height()), "kg", " is your ideal weight based on the Hamwi formula (1964)") else "" })
    output$w3 <- renderText({ 
      w <- w3(sex(), height())
      paste(w[1], "kg - ", w[2], "kg is your recommended weight based on the healthy BMI recommendation")
      })
  }
)