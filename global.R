library(shiny)
library(shinydashboard)
library(RCurl)
library(ggplot2)

path<-"https://s3-us-west-2.amazonaws.com/dpaequipo10/indicadores/"

#system(". ./vamb.sh")

plot_proporciones<-function(tbl,prod){
  
  subtbl<-tbl[tbl$Producto==prod,]
  
  subtbl$Segmento<-as.factor(subtbl$Segmento)
  
  fill<- c("steelblue", "yellowgreen", "violetred1")
  
  p6 <- ggplot(subtbl, aes(x = saldos, y = tm, size = Pob, fill = Segmento)) +
    geom_point(shape = 21) +
    ggtitle("Tasa de mora por Saldos") +
    labs(x = "Saldos", y = "Tasa de mora",
         size = "Proporción de población", fill = "Herramienta") +
    scale_x_continuous() +
    scale_size(range = c(5,10)) +
    scale_fill_manual(values = fill) + guides(colour = guide_legend(override.aes = list(size=100)))+
    theme(legend.position = "bottom", legend.direction = "horizontal",
          legend.box = "horizontal",
          legend.key.size = unit(1, "cm"),
          axis.line = element_line(size=1, colour = "black"),
          panel.grid.major = element_line(colour = "#d3d3d3"),
          panel.grid.minor = element_blank(),
          panel.border = element_blank(), panel.background = element_blank(),
          plot.title = element_text(size = 14, family = "Tahoma", face = "bold"),
          text=element_text(family="Tahoma"),
          axis.text.x=element_text(colour="black", size = 9),
          axis.text.y=element_text(colour="black", size = 9))
  
}