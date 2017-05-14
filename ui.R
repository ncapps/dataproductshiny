library(shiny)
library(ggplot2)
cuts <- c("Ideal","Premium","Very Good","Good","Fair")
clarities <- c("SI2","SI1","VS2","VS1","VVS2","VVS1","IF","I1")

fluidPage(
        titlePanel("Round Cut Diamond Search"),
        sidebarLayout(
                sidebarPanel(
                        p(
                                class = "text-muted",
                                paste("Search for diamonds by price, weight, cut, color, and clarity!")
                        ),
                        sliderInput('price',"Price", min=min(diamonds$price), 
                                max=max(diamonds$price),
                                value=c(min(diamonds$price), max(diamonds$price))),
                        sliderInput('carat',"Carat", min=min(diamonds$carat), 
                                max=max(diamonds$carat), 
                                value=c(min(diamonds$carat),max(diamonds$carat))), 
                        checkboxGroupInput("cut", "Cut", cuts,
                                inline=TRUE, selected=cuts),
                        checkboxGroupInput("color","Color",sort(unique(diamonds$color)),
                                inline=TRUE, selected=unique(diamonds$color)),
                        checkboxGroupInput("clarity","Clarity",clarities,
                                inline=TRUE,selected=clarities)
                ),
                mainPanel(
                        tabsetPanel(type = "tabs", 
                                    tabPanel("Price Distribution", plotOutput("plot")), 
                                    tabPanel("Summary", verbatimTextOutput("summary")), 
                                    tabPanel("Table", tableOutput("table"))
                        )
                        # verbatimTextOutput("id1"),
                        # verbatimTextOutput("id2"),
                        # verbatimTextOutput("id3"),
                        # verbatimTextOutput("id4"),
                        # plotOutput("newHist")
                )
        )
)

# shinyUI(pageWithSidebar( 
#         headerPanel("Round Cut Diamond Prices"),
#         sidebarPanel(
#                 
#         ), 
#         
# ))
