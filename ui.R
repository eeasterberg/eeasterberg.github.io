library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    title = "Running Times Predictor",
    h2("Running Time Predictor"),
    h5("Enter 1 to 3 distances (in miles) and times of races you have run"),
    h5("To predict a time for a different distance, enter the distance in the box labelled 'Enter distance to predict'"),
    hr(),
    fluidRow(
        column(3, 
         numericInput("d1", label = "Enter 1st distance", value = 3.1),
         numericInput("h1", label = "Hours", value = 0),
         numericInput("m1", label = "Minutes", value = 22),
         numericInput("s1", label = "Seconds", value = 0)),
        column(3,
         numericInput("d2", label = "Enter 2nd distance", value = 0),
         numericInput("h2", label = "Hours", value = 0),
         numericInput("m2", label = "Minutes", value = 0),
         numericInput("s2", label = "Seconds", value = 0)),
        column(3,
         numericInput("d3", label = "Enter 3rd distance", value = 0),
         numericInput("h3", label = "Hours", value = 0),
         numericInput("m3", label = "Minutes", value = 0),
         numericInput("s3", label = "Seconds", value = 0)),
         column(3,
          numericInput("predval", label = "Enter distance to predict", value = 0),
          verbatimTextOutput("dynamic_value")
        )),
    
         mainPanel(
             plotOutput("predPlot"),
             p("The actual line shows the prediction based on the times and distances you entered,"),
             p("while the ideal line shows what you should be able to run based on the standard model."),
             p("Note that, when only one time is entered, the actual and ideal lines coincide, so"),
             p("you won't see the ideal line.")
        )
))
