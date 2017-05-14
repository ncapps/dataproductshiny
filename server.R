library(shiny)
library(ggplot2)
library(dplyr)

shinyServer( 
        function(input, output){
                df <- reactive({diamonds %>% filter(
                        (price >= input$price[1]) &
                        (price <= input$price[2]) &
                        (carat >= input$carat[1]) &
                        (carat <= input$carat[2]) &
                        (cut %in% input$cut) &
                        (color %in% input$color) & 
                        (clarity %in% input$clarity)
                        )})
                
                ## Generate plot
                output$plot <- renderPlot({
                        hist(df()$price,
                             xlab="USD",
                             col="lightblue",
                             main="Diamond Price Distribution")
                })
                
                # Generate a summary of the data
                output$summary <- renderPrint({
                        summary(df())
                })
                
                # Generate an HTML table view of the data
                output$table <- renderTable({
                        data.frame(x=df())
                })
        } 
)