# server.R
server <- function(input, output, session) {
  print("server loaded")
  output$test_table <- renderTable(shiny_data)
  output$test_plot <- renderPlot({
    p <- ggplot(shiny_data, aes(x = Year, y = Anxiety_Depression_Pct, color = Demographic)) +
      geom_line() 
    print(p)
  }
  )
  # r <- reactiveValues(
  #   selected_data_type = NULL,
  #   selected_year_data = NULL, 
  #   producttypes = NULL,
  #   type_filtered_data = NULL,
  #   selected_banlist = "strict",
  #   banlist_filtered_data = NULL,
  #   result_table = NULL
  # )
  # 
  # s <- reactiveValues(
  #   selected_data_type = NULL,
  #   selected_year_data = NULL, 
  #   producttypes = NULL,
  #   type_filtered_data = NULL,
  #   selected_banlist = "strict",
  #   banlist_filtered_data = NULL,
  #   result_table = NULL
  # )
  # 
  # datachoiceServer("yearly_dataset_choice", r)
  # typefilterServer("yearly_type_choice", r)
  # yearly_chosen_banlist <- banlistServer("yearly_banlist_choice")
  # ingrfilterServer("yearly_banlist_choice", r, yearly_chosen_banlist)
  # showresultServer("yearly_result_choice", r)
  # 
  # # output$test_table <- renderTable({
  # #   req(r$banlist_filtered_data())
  # #   head(r$banlist_filtered_data())
  # # })
  # #output$test_table <- renderTable({
  # #  req(r$result_table())
  # #  return(r$result_table())
  # #}) |> bindEvent(input$submit)
  # output$test_table <- renderTable({
  #   req(r$result_table())
  #   return(r$result_table())
  # })
  # 
  # # banlistServer("banlist_choice", r)
  # # ingrfilterServer("banlist_choice", r)
  # 
  # # output$test_table <- renderTable(
  # #     head(r$ingr_filtered_data())
  # #   )
  # # output$test_table <- renderTable({
  # #   head(t_products)
  # # })
  # overviewchoiceServer("overview_dataset_choice", s)
  # typefilterServer("overview_type_choice", s)
  # # overview_chosen_banlist <- banlistServer("overivew_banlist_choice")
  # # ingrfilterServer("overview_banlist_choice", s, overview_chosen_banlist)
  # linegraphServer("overview_result_choice", s)
  # 
  # output$overview_plot <- renderPlot({
  #   req(s$result_table())
  #   s$result_table()
  # }) #|> bindEvent(input$plot_overview)
}