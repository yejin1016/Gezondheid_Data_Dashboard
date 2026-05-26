
#' Title
#'
#' @param id 
#'
#' @returns
#' @export
#'
#' @examples
typefilterUI <- function(id){
  ns <- NS(id)
  tagList(
    selectInput(inputId = ns("type_choice"),
                label = "Choose Product Type",
                choices = NULL,
                selected = NULL
    ),
    # tableOutput(outputId = ns("test_table"))
  )
}

#' Title
#'
#' @param id 
#' @param r 
#'
#' @returns
#' @export
#'
#' @examples
typefilterServer <- function(id, r){
  moduleServer(id, function(input, output, session){
    observeEvent(r$producttypes, {
      if (!is.null(r$selected_data_type) && r$selected_data_type == "T"){
        available_ref <- t_producttype_data[t_producttype_data$ProductType %in% r$producttypes, ]
      } else if (!is.null(r$selected_data_type) && r$selected_data_type == "E"){
        available_ref <- e_producttype_data[e_producttype_data$ProductType %in% r$producttypes, ]
      }
      choices_vec <- setNames(as.character(available_ref$ProductType), available_ref$Name)
      choices_vec <- c("All" = "All", choices_vec)
      
      updateSelectInput(session,
                        "type_choice",
                        choices = choices_vec,
                        selected = "All")
    })
    
    r$type_filtered_data <- reactive({
      df <- r$selected_year_data()
      if (is.null(df)) return(NULL)
      if (input$type_choice == "All") {
        return(df)
      } else {
        df <- df %>%
          filter(ProductType == as.integer(input$type_choice))
        return(df)
      }
    })
    
  })
  
}