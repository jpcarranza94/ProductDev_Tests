#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$slider_1 <- renderText({ 
        c("Output Slider input: ",input$slider_1)
    })
    
    output$slider_2 <- renderText({ 
        c("Output Slider rango: ",input$slider_2)
    })
    
    output$select_1 <- renderText({ 
        c("Seleccción del UI: ",input$select_1)
    })
    
    output$select_2 <- renderText({ 
        c("Seleccciones del UI: ",input$select_2)
    })
    
    output$date_1 <- renderText({ 
        c("Fecha elegida: ",as.character(input$date_1))
    })
    
    output$date_2 <- renderText({ 
        c("Fechas elegidas: ",as.character(input$date_2))
    })
    
    output$num_1 <- renderText({ 
        c("Número elegido: ",as.character(input$num_1))
    })
    
    output$checkbox_1 <- renderText({ 
        c(as.character(input$checkbox_1))
    })
    
    output$checkbox_2 <- renderText({ 
        c("Seleccciones del UI: ",as.character(input$checkbox_2))
    })
    
    output$radio_1 <- renderText({ 
        c("Seleccción del UI: ",as.character(input$radio_1))
    })
    
    output$text_1 <- renderText({ 
        c(as.character(input$text_1))
    })
    
    output$text_2 <- renderText({ 
        c(as.character(input$text_2))
    })
    
    output$actionButton_1 <- renderText({ 
        c(as.character(input$actionButton_1))
    })
    
    output$actionLink_1 <- renderText({ 
        c(as.character(input$actionLink_1))
    })
    
})
