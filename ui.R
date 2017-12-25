library(shiny)
shinyUI(fluidPage(
  titlePanel("Biorhythms"),
  sidebarLayout(
    sidebarPanel(
      h3("Please enter your date of birth"),
      # Start with decade view instead of default month view
      dateInput("dateob", "Date:",
                startview = "decade"),
      submitButton("Submit")
    ),
    mainPanel(
      h1("Your Biorhythms"),
      plotOutput("plot1")
    )
  )
))