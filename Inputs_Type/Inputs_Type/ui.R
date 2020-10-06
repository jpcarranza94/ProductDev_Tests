#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(lubridate)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Inputs en Shiny"),

    # Sidebar with a slider input for number of bins
    
    tabsetPanel(
        tabPanel("Inputs Examples",
            sidebarLayout(
                sidebarPanel(
                    sliderInput("slider_1",
                            "Seleccione valor:",
                            min = 0,
                            max = 100,
                            value = 50,
                            animate = TRUE,
                            post = "%"),
                    sliderInput("slider_2",
                                "Seleccione rengo:",
                                min = 0,
                                max = 200,
                                value = c(0,200),
                                animate = FALSE),
                    selectInput("select_1",
                                "Seleccione un auto:",
                                choices = rownames(mtcars) ),
                    br(),
                    selectInput("select_2",
                                "Seleccione autos:",
                                choices = rownames(mtcars),
                                multiple = TRUE,
                                selected=rownames(mtcars)[1]),
                    br(),
                    dateInput("date_1",
                              "Ingrese la fecha:",
                              value = today(),
                              min = today()-60,
                              max = today() + 30,
                              weekstart = 1,
                              language = "es"),
                    br(),
                    br(),
                    dateRangeInput("date_2",
                              "Ingrese Fechas:",
                              start = today()-7,
                              end = today(),
                              separator = "a"),
                    br(),
                    numericInput("num_1",
                                "Ingrese un numero:",
                                value = 10,
                                min = 0,
                                max = 100,
                                step = 1),
                    br(),
                    br(),
                    checkboxInput("checkbox_1",
                                  "Seleccione si verdadero",
                                  FALSE),
                    br(),
                    br(),
                    checkboxGroupInput("checkbox_2",
                                       "Seleccione opciones:",
                                       choices = LETTERS[1:5]),
                    radioButtons("radio_1",
                                 "Seleccione Genero:",
                                 choices  = c("Masculino","Femenino")),
                    textInput("text_1",
                              "Ingrese texto:"),
                    textAreaInput("text_2",
                                  "Ingrese Parrafo:",
                                  ),
                    actionButton("actionButton_1",
                                 "ok"),
                    actionLink("actionLink_1",
                               "Siguiente"),
                    submitButton("reprocesar")
                ),
                
                mainPanel(
                    h2("Slider input sencillo"),
                    verbatimTextOutput("slider_1"),
                    h2("Slider input rango"),
                    verbatimTextOutput("slider_2"),
                    h2("Select input"),
                    verbatimTextOutput("select_1"),
                    h2("Select Input Multiple"),
                    verbatimTextOutput("select_2"),
                    h2("Date Input"),
                    verbatimTextOutput("date_1"),
                    h2("Date Range Input "),
                    verbatimTextOutput("date_2"),
                    h2("Numeric Input"),
                    verbatimTextOutput("num_1"),
                    h2("single Checkbox Input"),
                    verbatimTextOutput("checkbox_1"),
                    h2("Grouped Checkbox Input"),
                    verbatimTextOutput("checkbox_2"),
                    h2("Radio Buttons Input"),
                    verbatimTextOutput("radio_1"),
                    h2("Text Input"),
                    verbatimTextOutput("text_1"),
                    h2("Text Area Input"),
                    verbatimTextOutput("text_2"),
                    h2("Action Button (ok)"),
                    verbatimTextOutput("actionButton_1"),
                    h2("Action Link (Siguiente)"),
                    verbatimTextOutput("actionLink_1"),
                position = "left"    
                )
            )
        ),
        tabPanel("Cargar Archivo",
                 sidebarLayout(
                    sidebarPanel(
                        h1("Subir Archivo al app"),
                        fileInput("file_1",
                                  "Seleccionar")
                    ),
                    mainPanel()
                 )
        )
    )
))
