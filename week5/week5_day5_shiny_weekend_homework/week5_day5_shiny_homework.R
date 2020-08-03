library(CodeClanData)
library(ggplot2)
library(dplyr)
library(shiny)
library(tidyverse)
library(shinythemes)

# UI section. Attempted to show game sales over the years. Was trying to get the year in order, but have now lost the years. 
ui <- fluidPage(
  
    titlePanel("Game Sales"),
    
    sidebarLayout(
      sidebarPanel(
        
        radioButtons("Year",
                     "Which Year?",
                     choices = order(sort(unique(game_sales$year_of_release))), inline = TRUE
                  ),
        actionButton("update", "Show game sales")
                ),
      
      mainPanel(
        "Select",
        plotOutput("developer")
      )
    )
    )
  
# Server section 
server <- function(input, output) {
      
    game_sales %>%
    filter(year_of_release == "year_of_release") %>%
    filter(genre == "Genre") %>%
    
    ggplot() +
    aes(x = year, y = count, fill = genre) +
    geom_col()
}

# Run the app     
shinyApp(ui = ui, server = server) 
    




