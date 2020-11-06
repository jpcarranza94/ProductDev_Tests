#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Ejemplo UI dinamico"),
    tabsetPanel(
        tabPanel('Ejemplo1',
                 numericInput('min',
                              'Limite inferior',
                              value = 0),
                 numericInput('max',
                              'Limite superior',
                              value = 15),
                 sliderInput('slider_ej1',
                             'Seleccione intervalo',
                             min = 0,
                             max = 15,
                             value = 5)
                 ),
        tabPanel('Ejemplo2',
                 sliderInput('s1',
                             'Seleccione intervalo s1',
                             min = -5,
                             max = 5,
                             value = 0),
                 sliderInput('s2',
                             'Seleccione intervalo s2',
                             min = -5,
                             max = 5,
                             value = 0),
                 sliderInput('s3',
                             'Seleccione intervalo s3',
                             min = -5,
                             max = 5,
                             value = 0),
                 sliderInput('s4',
                             'Seleccione intervalo s4',
                             min = -5,
                             max = 5,
                             value = 0),
                 actionButton('clean','limpiar')
                 ),
        tabPanel('Ejemplo 3',
                 numericInput('n',
                              'Corridas',
                              value = 10),
                 actionButton('correr',
                              'Correr')
                 ),
        tabPanel('Ejemplo 4',
                 numericInput('nvalue',
                              'valor',
                              value = 0,
                              max = 100)
                 ),
        tabPanel('Ejemplo 5',
                 numericInput('c',
                              'Temperatura en grados Celsius',
                              value = NULL),
                 
                 numericInput('f',
                              'Temperatura en grados Fahrenheit',
                              value = NULL)
        ),
        tabPanel('Ejemplo 6',
                 selectInput('dist',
                             'Distribucion',
                             choices = c('Normal','Uniforme','Exponencial')),
                 numericInput('nrandom',
                              'Numero de muestras',
                              100),
                 tabsetPanel(id='params',
                             type = 'hidden',
                             tabPanel('Normal',
                                      numericInput('mean',
                                                   'Media',
                                                   0),
                                      numericInput('sd',
                                                   'Desviacion',
                                                   1)
                                      ),
                             tabPanel('Uniforme',
                                      numericInput('min5',
                                                   'Minimo',
                                                   0),
                                      numericInput('max5',
                                                   'Maximo',
                                                   5)
                                      ),
                             tabPanel('Exponencial',
                                      numericInput('taza',
                                                   'taza',
                                                   value=1,
                                                   min = 0)
                                      )
                             ),
                 plotOutput('plot_dist')
                 )
    )

    
            
    
))
