###############################
# start of the server program #
###############################

#collors available#
palette(c("cadetblue", "tomato","coral3",
          "darksalmon", "firebrick", "gray88", "hotpink", "khaki",
          "yellowgreen", "tan2", "yellow1", "steelblue4",
          "tan1", "snow3","sienna","sienna1","cadetblue2","maroon1","azure4"         
          ))

#starts the server
shinyServer(function(input, output, session) {
    
    # Combine the selected variables into a new data frame
    selectedData <- eventReactive(input$goButton, {
        iris[, c(input$xcol, input$ycol)]
    })
    
    # Calculate the cluster with the columns chosen and the number of clusters
    clusters <- eventReactive(input$goButton, {
    #clusters <- reactive({
        kmeans(selectedData(), input$clusters)
    })
    
    #Make the plot of the cluster
    output$plot1 <- renderPlot({
        par(mar = c(5.1, 4.1, 0, 1))
        plot(selectedData(),
             col = clusters()$cluster,
             pch = 20, cex = 3)
        points(clusters()$centers, pch = 4, cex = 4, lwd = 4)
    })
    
})
