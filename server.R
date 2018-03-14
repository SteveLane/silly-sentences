library(shiny)
library(shinyjs)
library(dplyr)

fields <- c(paste0("people", 1:3),
            paste0("verb", 1:3),
            paste0("object", 1:3))

server <- function(input, output){
    
    ## Enable the Submit button when all fields are filled out
    
    observe({
        fields_filled <-
            fields %>%
            sapply(function(x) !is.null(input[[x]]) && input[[x]] != "") %>%
            all
        shinyjs::toggleState("gen_sentence", fields_filled)
    })

    sentence <- eventReactive(input$gen_sentence, {
        person <- sample(c(input$people1,
                           input$people2,
                           input$people3), 1)
        verb <- sample(c(input$verb1,
                         input$verb2,
                         input$verb3), 1)
        object <- sample(c(input$object1,
                           input$object2,
                           input$object3), 1)
        paste(person, verb, object)
    })

    output$sentence <- renderText({
        sentence()
    })
    
}
