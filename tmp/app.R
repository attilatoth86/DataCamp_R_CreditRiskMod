
# init Global -------------------------------------------------------------

library(shiny)
library(shinythemes)
library(gmodels)

options(scipen=999)

loan_data <- readRDS("loan_data_ch1.rds")

# init server -------------------------------------------------------------

server <- function(input, output, session){
    
}

# init UI -----------------------------------------------------------------

ui <- fluidPage(title = "Credit Risk Modeling",
                tags$style(type="text/css", "body {padding-top: 70px;}"),
                theme = shinytheme("yeti"),

# init navbarPage() -------------------------------------------------------

                navbarPage(title = "Credit Risk Modeling", 
                           position = "fixed-top",

# UI Page: Background -----------------------------------------------------

                           tabPanel("Background",
                                    column(width = 12,
                                           fluidRow(
                                               h2("Credit Risk"),
                                               p("The area of credit risk modeling is all 
                                                 about the event of loan default. Loan default event means that the borrower fails
                                                 to make full repayment to the lender. This event obviously results in loss for the
                                                 lender. In order to calculate the expected loss the following components have
                                                 to  be considered.")
                                            ),
                                           fluidRow(
                                               column(width=3,
                                                      h1("EL", tags$small("Expected Loss")),
                                                      h4("EL = PD x EAD x LGD")
                                                      ),
                                               column(width=3,
                                                      h2("PD", tags$small("Probability of Default")),
                                                      p("Overall probability of failing to make full repayment on the loan.
                                                        In order to predict this probability, two classes of information stand by."),
                                                      hr(),
                                                      p(h4("Application information"),
                                                        p("Pieces of information obtained during the loan application process."),
                                                          tags$ul(
                                                              tags$li("income"),
                                                              tags$li("marital status"),
                                                              tags$li("home ownership"),
                                                              tags$li("etc..")
                                                              )
                                                          ),
                                                      p(h4("Behavioural information"),
                                                        p("Insights based on historical interactions between the borrower and lender."),
                                                        tags$ul(
                                                            tags$li("account balance"),
                                                            tags$li("transaction history"),
                                                            tags$li("payment in arrears"),
                                                            tags$li("etc..")
                                                            )
                                                        )
                                                      ),
                                               column(width=3,
                                                      h2("EAD", tags$small("Exposure at Default")),
                                                      p("Expected loan value (outstanding amount) at the moment of default.")
                                               ),
                                               column(width=3,
                                                      h2("LGD", tags$small("Loss Given Default")),
                                                      p("Amount of the actual loss if the the default event occurs (expressed as a percentage of EAD).")
                                               )
                                              )
                                            )
                                      ),
                            tabPanel("Exploratory Data Analysis",
                                     includeMarkdown("EDA.Rmd")),
                              tabPanel("About",
                                       p("About page content"))

# end navbarPage() --------------------------------------------------------

                          ),

# UI footer ---------------------------------------------------------------

                           footer = fluidRow(
                               column(width=12,
                                      hr(),
                                      p(class="text-muted","2016. Created by Attila Toth.")
                                      )
                               )

# end fluidPage() ---------------------------------------------------------

               )

# shinyApp() call ---------------------------------------------------------

shinyApp(ui = ui, server = server)
