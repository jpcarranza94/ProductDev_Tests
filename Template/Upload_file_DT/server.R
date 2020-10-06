#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)
library(dplyr)
library(ggplot2)

shinyServer(function(input, output) {

    archivo_carga_1 = reactive({
        #print(c("Estamos en archivo_carga_1"))
        if(is.null(input$upload_file_1)){
            #print(c("Viene vacio"))
            return(NULL)
        }
        ext = strsplit(input$upload_file_1$name,split="[.]")[[1]][2]
        if(ext == 'csv'){
            #print(c("Formato correcto"))
            file_data = readr::read_csv(input$upload_file_1$datapath)
            #print(file_data)
            return(file_data)
        }
        #print(c(input$upload_file_1$type,ext))
        #print(c("Formato incorrecto"))
        return(NULL)
    })
    
    archivo_carga_2 = reactive({
        print(c("Estamos en archivo_carga_2"))
        if(is.null(input$upload_file_2)){
            print(c("Viene vacio"))
            return(NULL)
        }
        ext = strsplit(input$upload_file_2$name,split="[.]")[[1]][2]
        if(ext == 'csv'){
            print(c("Formato correcto"))
            file_data = readr::read_csv(input$upload_file_2$datapath)
            print(file_data)
            return(file_data)
        }
        #print(c(input$upload_file_2$type,ext))
        print(c("Formato incorrecto"))
        return(NULL)
    })
    
    output$contenido_archivo_1 = renderTable({
        archivo_carga_1()
    })
    
    output$contenido_archivo_2 = renderDataTable({
        archivo_carga_2()
    })
    
    output$tabla1 = DT::renderDataTable({
        diamonds %>% 
            datatable() %>%
            formatCurrency("price") %>%
            formatString(c("x","y","z"),suffix = " mm")
    })
    
    output$tabla2 = DT::renderDataTable({
        mtcars %>% 
            DT::datatable(options = list(pageLength = 5,
                                         lengthMenu = c(5,10,15)
                                         ),
                          filter = "top"
                          )
    })
    
    output$tabla3 = DT::renderDataTable({
        iris %>% 
            DT::datatable(extensions = "Buttons",
                          options = list(dom = "Bfrtip",
                                         buttons = c("csv"))
            )
    })
    
    output$tabla4 = renderDataTable({
        mtcars %>% datatable(selection = "single")
    })

    output$tabla4_single_click = renderText({
        input$tabla4_rows_selected
    })
    
    output$tabla5 = renderDataTable({
        mtcars %>% datatable()
    })
    
    output$tabla5_multi_click = renderText({
        input$tabla5_rows_selected
    })
    
    output$tabla6 = renderDataTable({
        mtcars %>% datatable(selection = list(mode='single',target = 'column'))
    })
    
    output$tabla6_single_click = renderText({
        input$tabla6_columns_selected
    })
    
    output$tabla7 = renderDataTable({
        mtcars %>% datatable(selection = list(mode='multiple',target = 'column'))
    })
    
    output$tabla7_multi_click = renderText({
        input$tabla7_columns_selected
    })
    
    output$tabla8 = renderDataTable({
        mtcars %>% datatable(selection = list(mode='single',target = 'cell'))
    })
    
    output$tabla8_single_click = renderText({
        input$tabla8_cells_selected
    })
    
    output$tabla9 = renderDataTable({
        mtcars %>% datatable(selection = list(mode='multiple',target = 'cell'))
    })
    
    output$tabla9_multi_click = renderPrint({
        input$tabla9_cells_selected
    })
    
})
