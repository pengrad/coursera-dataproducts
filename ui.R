library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Ideal Weight Calculator"),  
  sidebarPanel(    
    div("This is simple weight calculator."),
    div("Input your Gender and Height to see your ideal weight."),
    div("Weight will be calculated by Robinson formula, Hamwi formula and healthy BMI recommendation."),
    br(), 
    radioButtons("sex", label = h4("Gender:"), choices = list("Male" = 1, "Female" = 2), selected = 1),  
    sliderInput("height", label = h4("Height (cm):"), min=100, max=230, value=175)    
  ),
  mainPanel(
    h3("Results"),
    textOutput("w1"),
    textOutput("w2"),
    textOutput("w3")
  )  
))