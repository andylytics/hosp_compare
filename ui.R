shinyUI(fluidPage(
  titlePanel("HCAHPS: Patients who gave a rating of 9 or 10 (high)"),
  
  sidebarLayout(
    sidebarPanel(
      
      
      selectInput("var",
                  label = h4("Choose a Hospital:"),
                  choices = hospitals,
                  selected = "BETH ISRAEL DEACONESS MEDICAL CENTER"),
      br(),
      h6("Data Source: ", a("CMS Hospital Compare", href = "https://data.medicare.gov/data/hospital-compare")),
      h6("Code: ", a("Github Repository", href = "https://github.com/andylytics/health")),
      h6("Created by: ", a("Andy Rosa", href = "https://twitter.com/andylytics"))
      
    ),
    mainPanel(
      plotOutput("p"),
      p(),
      p(),
      em("Note: data includes all hospitals in RI and a selected few in MA")
    )
  )
))