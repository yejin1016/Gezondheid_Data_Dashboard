# UI module for data filtering
selectUI <- function(id){
  ns <- NS(id)
  tagList(
    # filter based on the topic
    selectInput(ns("topic_choice"),
                label = h5("Choose Topic"),
                choices = colnames(mvh_shiny_data)[4:ncol(mvh_shiny_data)]
                ),
    # filter based on demographic
    selectInput(ns("cat_choice"),
                label = h5("Choose Demographic"),
                choices = unique(mvh_shiny_data$Category)
    )
  )
}

# server module to filter base data
selectServer <- function(id, data){
  moduleServer(id, function(input, output, session){
    plot_data <- reactive({
      chosen_topic <- input$topic_choice
      filtered_data <- data %>%
        select(Year, Category, Subcategory, chosen_topic) %>%
        filter(Category == input$cat_choice)
    })
    return(plot_data)
  })
}

# server module to plot the filtered data
linegraphServer <- function(id, plot_data){
  moduleServer(id, function(input, output, session){
    plot_filtered_data(plot_data, input$topic_choice, input$cat_choice)
  })
  
}

