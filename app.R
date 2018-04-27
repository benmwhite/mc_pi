library(shiny)
library(ggplot2)

ui <- fluidPage(
  titlePanel("Estimating Pi using Monte Carlo Simulation"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("n",
                  "Number of samples to generate:",
                  min = 0,
                  max = 50000,
                  value = 100,
                  step = 20)
    ),
    mainPanel(
      plotOutput("distPlot")
    )
  )
)

server <- function(input, output) {
  output$distPlot <- renderPlot({
    
    #sampling x and y, tagging them as in or out of circle
    samps <- data.frame(replicate(2, runif(input$n, -1, 1)))
    samps$in_circ <- samps$X1^2 + samps$X2^2 < 1
    
    #estimating pi
    pi.est <- 4 * mean(samps$in_circ)
    
    #prep for plotting circle
    c.seq <- seq(from = 0, to = 2 * pi, length.out = 200)
    circ <- data.frame(x = cos(c.seq), y = sin(c.seq))
    
    #plotting
    ggplot(samps, aes(x = X1, y = X2)) +
      geom_point(aes(colour = in_circ), show.legend = FALSE, alpha = 0.05) +
      geom_path(data = circ, aes(x, y)) +
      xlab("x") +
      ylab("y") +
      ggtitle(paste0("Samples: ",
                     as.character(input$n),
                     ", Estimate of pi: ",
                     as.character(round(pi.est, 4)))) +
      coord_fixed() +
      theme_minimal()
  })
}

shinyApp(ui = ui, server = server)

