library(shiny)
library(shinyjs)
library(dplyr)

exTxt <-
    'This simple application allows you to generate silly sentences! Using the text box inputs, enter the names of three of your friends (one in each box), three verbs (action words, e.g. "throws"), and three objects (e.g. "a horse"). Then press the button to generate a silly sentence!'

fluidPage(
    
    ## Application title
    titlePanel("Silly sentence simulator!"),
    
    sidebarLayout(
        ## Sidebar with a slider input
        sidebarPanel(
            div(
                id = "people_entry",
                h3("Enter three of your friend's names:"),
                textInput(
                    "people1",
                    "Name 1"
                ),
                textInput(
                    "people2",
                    "Name 2"
                ),
                textInput(
                    "people3",
                    "Name 3"
                )
            ),
            div(
                id = "verb_entry",
                h3("Enter three verbs (action words):"),
                textInput(
                    "verb1",
                    "Verb 1"
                ),
                textInput(
                    "verb2",
                    "Verb 2"
                ),
                textInput(
                    "verb3",
                    "Verb 3"
                )
            ),
            div(
                id = "object_entry",
                h3('Enter three objects (e.g. "a horse")'),
                textInput(
                    "object1",
                    "Object 1"
                ),
                textInput(
                    "object2",
                    "Object 2"
                ),
                textInput(
                    "object3",
                    "Object 3"
                )
            ),
            actionButton("gen_sentence", "Generate a funny sentence!")
        ),
     
        ## Show a plot of the solution
        mainPanel(
            fluidRow(
                column(8, p(exTxt, style = "color:blue; font-size: 20px;"))
            ),
            fluidRow(
                column(8, p(textOutput("sentence")))
            )
        )
        
    ),

    tags$head(
             tags$style(
                      "#sentence{color: teal; font-size: 40px; font-style: italic;}"
                  )
         ),
    
    shinyjs::useShinyjs()
    ## Change
    ## includeCSS("~/github/Website/css/app.css")
)
