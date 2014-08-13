shinyUI(fluidPage(
  titlePanel("HCAHPS: Patients who gave a rating of 9 or 10 (high)"),
  
  sidebarLayout(
    sidebarPanel(
      
      
      selectInput("var",
                  label = h4("Choose a Hospital:"),
                  choices = hospitals,
                  selected = "BETH ISRAEL DEACONESS MEDICAL CENTER"),
      br(),
      
#       checkboxInput("cbvar",
#                     label = "Add Smoothing",
#                     value = FALSE),
      br(),
      radioButtons("radio", label = h5("Choose a Smoothing Method"),
                  choices = list("No Smoothing" = 1, "Linear" = 2,
                            "Generalized Linear" = 3, "Local (Loess)" = 4),selected = 1),

      br(),
      
      p(a("ggplot2 smoothing resource", href = "http://docs.ggplot2.org/current/stat_smooth.html")),
      
      br(),      

      p("Data Source: ", a("CMS Hospital Compare", href = "https://data.medicare.gov/data/hospital-compare")),
      p("Code: ", a("Github Repository", href = "https://github.com/andylytics/hosp_compare")),
      p("Created by: ", a("Andy Rosa", href = "https://www.linkedin.com/pub/andrew-rosa/99/787/a64"))
      
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