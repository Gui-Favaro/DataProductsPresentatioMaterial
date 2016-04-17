##############################
# start of the user interface
##############################

#loads the library
library(shiny)

#loading the layout
shinyUI(pageWithSidebar(
    headerPanel('My first App: Calculating the Iris k-means clustering'), #this is the title
    sidebarPanel(
        selectInput('xcol', 'X Variable', names(iris)),
        p("Choose one of the variables listed above"),
        selectInput('ycol', 'Y Variable', names(iris),
                    selected=names(iris)[[2]]), #here it is chosen the columns of the cluster
        p("Choose another one of the variables listed above"),
        numericInput('clusters', 'Cluster count', 3,
                     min = 1, max = 20), # Here is the numbers of clusters
        p("Choose the number of clusters in the range [1-20]"),
        br(),
    actionButton("goButton", "Clusters shall be made!"), # the button to calculate everything
    p("Click the button to update the cluster with the variables chosen and the numbers
      of clusters above.")
    ),
    mainPanel(
        plotOutput('plot1') #here is where the plot of the cluster will be shown
    )
))

############################
# End of the user interface
############################