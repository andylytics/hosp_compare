library(shiny)
library(dplyr)
library(ggplot2)
library(scales)

#d.bench <- filter(d, type == "Benchmark")
#d.hosp <- filter(d, variable == input$var)

#d.plot <- rbind_list(d.bench, d.hosp)

#d.plot <- filter(d, variable == input$var)

shinyServer(function(input, output) {
  
  output$p <- renderPlot({
    ggplot(filter(d, variable %in% c(input$var, benchmarks)), aes(EndDate, value, colour = variable)) +
      geom_point(size = 5) +
      geom_line() +
      scale_x_date(breaks = filter(d, variable == input$var)$EndDate) +
      xlab("12 months ending date") +
      ylab("Percentage Rating of 9 or 10") +
      ggtitle(paste0("HCAHPS Percent of Patients who gave a 9 or 10 Rating")) +
      theme(axis.text.x = element_text(angle = 90, size = 14), axis.title.x = element_text(size = 14), axis.title.y = element_text(size = 12), legend.title = element_blank())
      
      #scale_x_discrete(breaks = unique(d.plot$EndDate))
  })
})
