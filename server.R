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
    pd <- filter(d, variable %in% c(input$var, benchmarks))
    pd$variable <- factor(pd$variable, levels = c(input$var, benchmarks))
    
    if (input$radio == 1){
      ggplot(pd, aes(EndDate, value, colour = factor(variable))) +
        #stat_smooth(method = "lm", aes(fill = factor(variable))) +
        geom_line() +
        scale_x_date(breaks = filter(d, variable == input$var)$EndDate) +
        scale_colour_discrete(breaks = levels(pd$variable)) +
        geom_point(size = 5) +
        xlab("12 months ending date") +
        ylab("Percentage Rating of 9 or 10") +
        ggtitle(paste0("HCAHPS Percent of Patients\nwho gave a 9 or 10 Rating")) +
        theme(axis.text.x = element_text(angle = 90, size = 14), axis.title.x = element_text(size = 14), axis.title.y = element_text(size = 12), legend.title = element_blank())
    }
    else if (input$radio == 2){
      ggplot(pd, aes(EndDate, value, colour = factor(variable))) +
        stat_smooth(method = "lm", aes(fill = factor(variable))) +
        #geom_line() +
        scale_x_date(breaks = filter(d, variable == input$var)$EndDate) +
        scale_colour_discrete(breaks = levels(pd$variable)) +
        geom_point(size = 5) +
        xlab("12 months ending date") +
        ylab("Percentage Rating of 9 or 10") +
        ggtitle(paste0("HCAHPS Percent of Patients\nwho gave a 9 or 10 Rating")) +
        theme(axis.text.x = element_text(angle = 90, size = 14), axis.title.x = element_text(size = 14), axis.title.y = element_text(size = 12), legend.title = element_blank())
    }
    else if (input$radio == 3){
      ggplot(pd, aes(EndDate, value, colour = factor(variable))) +
        stat_smooth(method = "glm", aes(fill = factor(variable))) +
        #geom_line() +
        scale_x_date(breaks = filter(d, variable == input$var)$EndDate) +
        scale_colour_discrete(breaks = levels(pd$variable)) +
        geom_point(size = 5) +
        xlab("12 months ending date") +
        ylab("Percentage Rating of 9 or 10") +
        ggtitle(paste0("HCAHPS Percent of Patients\nwho gave a 9 or 10 Rating")) +
        theme(axis.text.x = element_text(angle = 90, size = 14), axis.title.x = element_text(size = 14), axis.title.y = element_text(size = 12), legend.title = element_blank())
    }
    else if (input$radio == 4){
      ggplot(pd, aes(EndDate, value, colour = factor(variable))) +
        stat_smooth(method = "loess", aes(fill = factor(variable))) +
        #geom_line() +
        scale_x_date(breaks = filter(d, variable == input$var)$EndDate) +
        scale_colour_discrete(breaks = levels(pd$variable)) +
        geom_point(size = 5) +
        xlab("12 months ending date") +
        ylab("Percentage Rating of 9 or 10") +
        ggtitle(paste0("HCAHPS Percent of Patients\nwho gave a 9 or 10 Rating")) +
        theme(axis.text.x = element_text(angle = 90, size = 14), axis.title.x = element_text(size = 14), axis.title.y = element_text(size = 12), legend.title = element_blank())
    }
      
      #scale_x_discrete(breaks = unique(d.plot$EndDate))
  })
})
