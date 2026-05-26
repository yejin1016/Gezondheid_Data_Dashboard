#' Title
#'
#' @param id 
#'
#' @returns
#' @export
#'
#' @examples
# plotUI <- function(id){
#   ns <- NS(id)
#   tagList(
#     # actionButton(ns("plot_button"),
#     #              label = "Plot")
#     # selectInput(inputId = ns("result_choice"),
#     #             label = "Choose What You Want to See",
#     #             choices = c("Number of Active Products" = "num_prod", "Most Used Substance" = "pop_ingr"),
#     #             selected = "num_prod"
#     # ),
#     # checkboxGroupInput(inputId = ns("cat_choice"),
#     #                    label = "Choose the Groups to Show", 
#     #                    choices = c("only_s", "only_p", "both_s_p", "pass"),
#     #                    selected = c("only_s", "only_p", "both_s_p", "pass")
#     # )
#     # tableOutput(outputId = ns("test_table"))
#   )
# }

#' Title
#'
#' @param id 
#' @param r 
#'
#' @returns
#' @export
#'
#' @examples
linegraphServer <- function(id, r){
  moduleServer(id, function(input, output, session){
    r$result_table <- reactive({
      # df <- r$banlist_filtered_data()
      big_df <- r$type_filtered_data()
      cat_choice <- input$cat_choice
      return(
        plot_overview(big_df, cat_choice, strict_ban_list, potential_ban_list)
      )
      
    })
  })
  
}