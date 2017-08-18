# require(shiny)
library(shiny)
library(shinydashboard)
library(ggplot2)
library(datasets)
options(shiny.maxRequestSize=1000*1024^2) 



# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  
  
  tbl1<-eventReactive(input$file1,{
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    read.csv(inFile$datapath, header = T)
    
  })
  # observe({ subtbl1() })
  
  plotInput1<-reactive({
    
    plot_proporciones(tbl1(),input$select)
    
  })

  output$products<-renderUI({
    
    productos<-sort(unique(tbl1()$Producto))
    
    selectInput("select", label = h3("Selecciona el producto a evaluar"), 
                choices = productos, 
                selected = productos[1])
    
  })
  
  output$plot1<-renderPlot({
    
    
    print(plotInput1())
    
  })
  
  output$plot2<-renderPlot({
    
    
    hist(rnorm(10000,mean = 3000,sd = 500),freq = F,xlab = "Estimación",main = "Saldos en MMDP")
    
  })
  
  output$table1 = renderDataTable({
    mtcars[1:1000,3:5]
  })
  
})
