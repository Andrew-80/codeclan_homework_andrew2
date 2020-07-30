library(shiny)
library(tidyverse)
library(CodeClanData)
library(shinythemes)

source("global.R")

all_teams <- unique(olympics_overall_medals$team)

# UI section 

ui <- fluidPage(
  
  theme = shinytheme("flatly"),
  
  titlePanel("Olympic Medals"),
  
  tabsetPanel(
  
  sidebarLayout(
    sidebarPanel(
      
      radioButtons("season",
                   "Summer or Winter Olympics?",
                   choices = c("Summer", "Winter")),
      
      selectInput("team",
                  "Which team?",
                  choices = all_teams)
    ),
    mainPanel(
      plotOutput("medal_plot")
    )
  )
  )
)

# Server section 

server <- function(input, output) {
  output$medal_plot <- renderPlot({
    plot_medal(input$team, input$season)
  })
}

# Run the app
shinyApp(ui = ui, server = server)













