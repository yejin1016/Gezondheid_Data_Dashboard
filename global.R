# global.R
library(rsconnect)
library(shiny)
library(shinythemes)
library(cbsodataR)
library(bslib)
library(ggplot2)
library(dplyr)
library(tidyr)
library(markdown)

# load the raw data from CBS directly
data <- cbs_get_data("85454eng") %>%
        cbs_add_label_columns()

# trim raw data and simplify the structure
data_filter_and_extract_group <- data %>%
  separate_wider_delim(
    cols = Characteristics_label,
    delim = ": ",
    names = c("Category", "Subcategory"),
    too_few = "align_start"
  ) %>%
  mutate(Subcategory = ifelse(is.na(Subcategory), "Total", Subcategory))

# final trimming for the showcase purpose
mvh_shiny_data <- data_filter_and_extract_group %>%
  filter(Margins_label == "Value") %>%
  # only 4 demographics chosen
  filter(Category %in% c("Sex", "Age", "Origin", "Equivalised income")) %>%
  select(
    Year = Periods_label,
    Category,
    Subcategory,
    # 5 targeted healthcare metrics
    "Overall Wellness" = GoodOrVeryGood_1,
    "GP Visit Rate" = PersonsWithAtLeast1Contact_85,
    "Psychological Distress" = PsychologicalDistressPast4Weeks_5,
    "Chronic Disorder Rate" = k_1OrMoreChronicDisorders_27,
    "Diabetes Rate" = DiabetesTotal_28
  ) 
  
# function to plot the data
plot_filtered_data <- function(data, topic, cat){
  ggplot(data, aes(x = Year, .data[[topic]], group = Subcategory, color = Subcategory)) +
    geom_line(aes(color = Subcategory), linewidth = 1) +
    geom_point(aes(color = Subcategory), size = 3) +
    labs(x = "Year", 
         y = "Proportion", 
         title = paste0("Yearly Trend of ", topic, " Based on ", cat),
         color = "Subgroup") +
    theme(plot.title = element_text(size = 20, face = "bold", hjust = 0)) +
    theme_minimal(base_size = 14)
}
