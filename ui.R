shinyUI(fluidPage(
  titlePanel("HCAHPS: Patients who gave a rating of 9 or 10 (high)"),
  
  sidebarLayout(
    sidebarPanel(
      
      
      selectInput("var",
                  label = h4("Choose a Hospital:"),
                  choices = hospitals,
                  selected = "BETH ISRAEL DEACONESS MEDICAL CENTER"),
      br(),
      
      checkboxInput("cbvar",
                    label = "Add Smoothing",
                    value = FALSE),
      
      br(),
      
      p("Data Source: ", a("CMS Hospital Compare", href = "https://data.medicare.gov/data/hospital-compare")),
      p("Code: ", a("Github Repository", href = "https://github.com/andylytics/hosp_compare")),
      p("Created by: ", a("Andy Rosa", href = "https://twitter.com/andylytics"))
      
    ),
    mainPanel(
      p(strong("NOTE:"), " you may experience issues with the dropdown box behavior in Internet Explorer. The application performs well in Safari (desktop and mobile), Chrome and Firefox"),
      br(),
      plotOutput("p"),
      br(),
      p(),
      p(),
      p("Data includes all hospitals in RI and a selected few in MA. Three benchmarks are included: ", code("Nat_Avg"), " is the National Average, ", code("RI"), " is the Rhode Island average and ", code("MA"), " is the Massachusetts average (for all MA hospitals in the Hospital Compare dataset, not just those selected).")
    )
  )
))