# shiny UI
ui <- page_fluid(
  theme = bs_theme(version = 5, bootswatch = "cerulean"),
  tags$head(tags$meta(charset="UTF-8")),
  tags$style(HTML("body { font-family: Arial, Helvetica, sans-serif; }")),
  navbarPage("Dutch Public Health Monitor", 
             tabPanel("Plot Data",
  sidebarLayout(
    sidebarPanel(
       width = 2,
       selectUI("select_options"),
       actionButton("plot_button", "Plot")
     ),
     mainPanel(
       width = 10,
       plotOutput("final_plot", width = 800, height = 500)
     )
   )
                      ),
             tabPanel("About",
                      icon = icon("info-circle"),
                      br(),
                      includeMarkdown("README.md"))
)
)