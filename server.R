# server.R
server <- function(input, output, session) {
  # filter base data based on UI
  plot_data <- selectServer("select_options", data = mvh_shiny_data)
  # plot data and link to plot button
  output$final_plot <- renderPlot({
    linegraphServer("select_options", plot_data = plot_data())
  }) %>% bindEvent(input$plot_button)

}