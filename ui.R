
library(shiny)

# Define UI for application that draws a histogram
fluidPage(
  
  # # Application title
  titlePanel("Exploring the iris Data"),
  
  div(class="read-me-div",
      h4("About"),
      div(class="page-text",
          p( span("This simple shiny app is for creating dynamic bar graphs from the iris dataset. 
                This dataset comes  with the datasets package. 
                It contains measurements in centimeters of the 
                variables sepal length and width and petal length and width, respectively, 
                for 50 flowers from each of 3 species of iris. 
                The species are Iris setosa, versicolor, and virginica.")),
          h4("How to use"),
          p( span("The app contains the side panel for selecting the measurement to summarize.
                  The app calculates the means of the measurements by the Species.
                  Once a variable is selected, the graph is updated for the selected variable "))
      )
      
  ),
  # Sidebar with a select input based on column in the dataset
  sidebarLayout(
    sidebarPanel(
      selectInput("analysiscol",
                  "Variable to analyse:",
                  names(subset(datasets::iris, -Species)))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("outPlot")
    )
  )
)
