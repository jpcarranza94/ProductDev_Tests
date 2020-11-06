#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)

out_click_green<- NULL
out_click_blue<- NULL
out_hover<-NULL
df_print <- mtcars

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    
     
    puntos <- reactive({
        if(!is.null(input$clk$x)){
            df<-nearPoints(mtcars,input$clk,xvar='wt',yvar='mpg')
            out <- df %>% 
                select(wt,mpg)
            out_click_green <<- rbind(out_click_green,out) %>% distinct()
            df_print <<- df
            return(out)
        }
        if(!is.null(input$mhover$x)){
            df<-nearPoints(mtcars,input$mhover,xvar='wt',yvar='mpg')
            out <- df %>% 
                select(wt,mpg)
            out_hover <<- out
            return(out_hover)
        }
        
        if(!is.null(input$dclk$x)){
            df<-nearPoints(mtcars,input$dclk,xvar='wt',yvar='mpg')
            out <- df %>% 
                select(wt,mpg)
            out_click_green <<- setdiff(out_click_green,out)
            out_click_blue <<- setdiff(out_click_blue,out)
            return(out_hover)
        }
        
        if(!is.null(input$mbrush)){
            df<-brushedPoints(mtcars,input$mbrush,xvar='wt',yvar='mpg')
            out <- df %>% 
                select(wt,mpg)
            out_click_blue <<- rbind(out_click_blue,out) %>% dplyr::distinct()
            df_print <<- df
            return(out_hover)
        }
        
        
        
    })
    
    
    mtcars_plot <- reactive({
        plot(mtcars$wt,mtcars$mpg,xlab="wt",ylab="Miles per Galon")
        puntos <-puntos()
        if(!is.null(out_hover)){
            points(out_hover[,1],out_hover[,2],
                   col='gray',
                   pch=16,
                   cex=2)}
        if(!is.null(out_click_green)){
            points(out_click_green[,1],out_click_green[,2],
                   col='green',
                   pch=16,
                   cex=2)}
        if(!is.null(out_click_blue)){
            points(out_click_blue[,1],out_click_blue[,2],
                   col='blue',
                   pch=16,
                   cex=2)}
        
    })
    
    
    output$plot_click_options = renderPlot({
        mtcars_plot()
        #plot(mtcars$wt,mtcars$mpg,xlab="wt",ylab="Miles per Galon")
    })

    
    click_table <- reactive({
        input$clk$x
        input$dclk$x
        input$mhover$x
        input$mbrush
        if(!is.null(out_click_blue)&!is.null(out_click_green)) {df_print <<- rbind(out_click_blue,out_click_green)}
        df_print 
    })
    
    
    output$mtcars_tbl = DT::renderDataTable({
        click_table() %>% DT::datatable()
    })
    
})