library(shiny)

shinyUI(fluidPage(
        titlePanel("Predict Height of Black Cherry Trees"),
        sidebarLayout(
                sidebarPanel(
                        sliderInput("sliderGirth","What is the girth of the tree in inches?",5,25,value=15),
                        sliderInput("sliderVolume","What is the volume of timber in cubic feet?",10,80,value=45),
                        h3("Predicted Height of Tree using Girth:"),
                        textOutput("pred1"),
                        h3("Predcicted Height of Tree using Volume:"),
                        textOutput("pred2"),
                        h3("Predicted Height of Tree given Girth and Volume:"),
                        textOutput("pred3")
                        
                ),
                mainPanel(
                plotOutput("plot1"),
                plotOutput("plot2")
                       )
        )
))