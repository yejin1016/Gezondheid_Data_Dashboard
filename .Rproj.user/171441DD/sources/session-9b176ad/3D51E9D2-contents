selectUI <- function(id){
  ns <- NS(id)
  tagList(
    selectInput(ns("topic_choice"),
                label = "Choose Topic",
                choices = colnames(mvh_shiny_data)[4:ncol(mvh_shiny_data)]
                ),
    
    selectInput(ns("cat_choice"),
                label = "Choose Category",
                choices = unique(mvh_shiny_data$Category)
    )
  )
}

selectServer <- function(id, data){
  moduleServer(id, function(input, output, session){
    plot_data <- reactive({
      chosen_topic <- input$topic_choice
      filtered_data <- data %>%
        select(Year, Category, Subcategory, chosen_topic) %>%
        filter(Category == input$cat_choice)
      print(filtered_data)
    })
    return(plot_data)
    
  })
}

linegraphServer <- function(id, plot_data){
  moduleServer(id, function(input, output, session){
    plot_filtered_data(plot_data, input$topic_choice)
  })
  
}

