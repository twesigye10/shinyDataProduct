
library(shiny)
library(tidyverse)

# Define server logic required to draw a histogram
function(input, output, session) {

    output$outPlot <- renderPlot({
      
      df_means <- datasets::iris %>% 
        group_by(Species) %>% 
        summarise(Mean = mean(!!sym(input$analysiscol)))
        
      ggplot(data = df_means, aes(x = Mean, y = Species)) + # both x and y provided
        geom_col(fill = "blue") +  # uses stat_identity() by default
        theme_bw() +
        labs(title = paste("Mean", str_replace(string = input$analysiscol, pattern = "\\.", replacement = " "), "by species"))+
        theme(plot.title=element_text(family='', face='bold', size=18))

    })

}
