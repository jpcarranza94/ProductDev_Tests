#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(

    titlePanel("Template"),
    tabsetPanel(
        tabPanel("Cargar Archivo y dataFrames",
                 sidebarLayout(
                     sidebarPanel(
                         h2("Subir archivo"),
                         fileInput("upload_file_1",
                                   "Seleccione un archivo",
                                   buttonLabel = "Cargar",
                                   accept = c(".csv",".tsv"))
                         ),
                     mainPanel(
                         tableOutput("contenido_archivo_1")
                         )
                 )
                ),
        tabPanel("Cargar Archivo DT",
                 sidebarLayout(
                     sidebarPanel(
                         h2("Subir archivo"),
                         fileInput("upload_file_2",
                                   "Seleccione un archivo",
                                   buttonLabel = "Cargar",
                                   accept = c(".csv",".tsv"))
                     ),
                     mainPanel(
                         DT::dataTableOutput("contenido_archivo_2")
                     )
                 )
        ),
        tabPanel("DT Option",
                 h2("Formato Columna"),
                 fluidRow(column(width = 12,
                                 DT::dataTableOutput("tabla1")
                    )
                 ),
                 h2("Opciones"),
                 fluidRow(column(width = 12,
                                 DT::dataTableOutput("tabla2")
                    )
                 ),
                fluidRow(column(width = 12,
                                DT::dataTableOutput("tabla3")
                    )
                )
        ),
        tabPanel("Clicks en tabla",
                 fluidRow(column(width = 12,
                                 h2("Click en una fila"),
                                 DT::dataTableOutput("tabla4"),
                                 verbatimTextOutput("tabla4_single_click")
                    )
                ),
                fluidRow(column(width = 12,
                                h2("Click en multiples filas"),
                                DT::dataTableOutput("tabla5"),
                                verbatimTextOutput("tabla5_multi_click")
                    )
                ),
                fluidRow(column(width = 12,
                                h2("Click en una columna"),
                                DT::dataTableOutput("tabla6"),
                                verbatimTextOutput("tabla6_single_click")
                    )
                ),
                fluidRow(column(width = 12,
                                h2("Click en multiples columnas"),
                                DT::dataTableOutput("tabla7"),
                                verbatimTextOutput("tabla7_multi_click")
                    )
                ),
                fluidRow(column(width = 12,
                                h2("Click en una celda"),
                                DT::dataTableOutput("tabla8"),
                                verbatimTextOutput("tabla8_single_click")
                )
                ),
                fluidRow(column(width = 12,
                                h2("Click en multiples celda"),
                                DT::dataTableOutput("tabla9"),
                                verbatimTextOutput("tabla9_multi_click")
                )
                )
        )
    )

))
