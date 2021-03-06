# Download all packages: The first time is going to take time
source("check_packages.R")

#load required packages
library(plotly)
library(shiny)
library(shinycssloaders)


# for spinners 2-3 match the background color of wellPanel
options(spinner.color.background="#F5F5F5")

# Custom user friendly error css
css <- "
.shiny-output-error { visibility: hidden; }
.shiny-output-error:before {
  visibility: visible;
  content: 'An error occurred. Please check your input data for validation.'; }
}"

# Define UI for application
shinyUI(

  tagList(
    #initialize css
    tags$style(type="text/css", css),
    navbarPage(
      "CVD Risk App",
      tabPanel(

        # put the title on input tab
        "Individual Risk",
        sidebarPanel(style = "overflow-y:scroll; max-height: 550px",

          # persone name input text
          textInput("name", "Name:", "_"),

          # numeric input for age
          numericInput("age", "Age:", 30, min = 30, max = 74),

          # gender option button
          radioButtons(
            "gender",
            "Gender:",
            choices = c("Male" = "M", "Female" = "F"),
            selected = "M" #set default to Male
          ),

          # sbp numeric input
          numericInput(
            "sbp",
            "Systolic blood pressure:",
            90,
            min = 90,
            max = 200
          ),

          # SBP under treatment option button
          radioButtons(
            "isSbpTreated",
            "is SBP under treatment:",
            choices = c("NO" = FALSE, "YES" = TRUE),
            selected = FALSE #set default to no sbp treated
          ),

          # Smoking option button
          radioButtons(
            "smoking_status",
            "Smoking:",
            choices = c("NO" = FALSE, "YES" = TRUE),
            selected = FALSE #set default to no smoking
          ),

          # diabetes option button
          radioButtons(
            "diabetes_status",
            "Diabetic:",
            choices = c("NO" = FALSE, "YES" = TRUE),
            selected = FALSE #set default to no diabetes
          ),
          tabsetPanel(  id = "bmiTab",

            # tab panel for bmi
            tabPanel("BMI", value="bmi", numericInput(
              "bmi", "BMI:", 15, min = 15, max = 50
            )),

            # tab panel for non-bmi
            tabPanel(
              "None-BMI",  value="nonBmi",
              numericInput("hdl", "HDL:", 10, min = 10, max = 100),
              numericInput(
                "cholesterol",
                "Total Cholesterol:",
                100,
                min = 100,
                max = 405
              )
            )
          )
        ),
        mainPanel(
          tabsetPanel(
            tabPanel(
              "Result",

              # plot the radar plot
              fluidRow(withSpinner(
                plotOutput("cvdRadarPlot"),
                type = 4
              ),
              textOutput("cvdOneText")
              )
            ),
            tabPanel(
              "Data",

              # plot data
              fluidRow(withSpinner(
                tableOutput("cvdOneTable"),
                type = 4
              )

              # Display output text

              )
            )
          )
        )
      ),
      tabPanel(
        "Population Risk",
        sidebarPanel(
          tabsetPanel( id = "populationTab",
             # slider for sample size
            tabPanel("Simulation", value="simulation",
                     sliderInput("sample_size", "Sample Size:", 1, 500, 50)
            ),
            # upload panel for csv
            tabPanel(
              "Upload Data", value="upload",
              fileInput('file1', 'Choose CSV File',
                        accept=c('text/csv', 'text/comma-separated-values,text/plain', '.csv'))
              ,
              tags$hr(),

              # header checkbox
              checkboxInput('header', 'Header', TRUE),

              # set separators
              radioButtons('sep', 'Separator',
                           c(Comma=',',
                             Semicolon=';',
                             Tab='\t'),
                           ','),
              # Set quotation marks
              radioButtons('quote', 'Quote',
                           c(None='',
                             'Double Quote'='"',
                             'Single Quote'="'"),
                           '"')
            )
          )

        ),
        mainPanel(
          tabsetPanel(
            tabPanel(
              "Visualization",

              # plot 3d plot of population
              fluidRow(withSpinner(
                plotlyOutput("cvdPopulationPlot"),
                type = 4
              ))


            ),
            tabPanel("Data Table",

                     # plot the data table
                     fluidRow(withSpinner(
                       dataTableOutput(outputId = 'cvdPopulationDT'),
                       type = 4
                     ))

                  )
          )
        )
      ),

      # Tab about the app and authors
      tabPanel("About",
               h3(" Introduction:"),
               (" CVD Risk App is a shiny app that utilize "),
                tags$a(href = "https://github.com/PHP2560-Statistical-Programming-R/r-framingham",
                      "frisk R package "),
                ("to estimate projected 10 years Cardiovascular Diseases(CVD) risk
                based on"),
               tags$a(href = "https://www.framinghamheartstudy.org/risk-functions/cardiovascular-disease/10-year-risk.php",
                      "Framingham Heart study"),
               tags$a(href = "http://circ.ahajournals.org/content/117/6/743.long", "published"),
               ( "by Ralph B. D’Agostino e all in 2008." ),
               br(),
               h3(" Usage: "),
               ( "This App can be used by statistician or physicianes without the need for any R expertise to do:"),
               br(),
                 ("1. Survival analysis"),
               br(),
                 ("2. Time series"),
               br(),
                 ("3. Risk prediction"),
               br(),
               (" Also could be used by any person to calculate his personal risk and know which risk factors contribute to his CAD 10 risk."),
               br(),
               h3("Guide"),
               h4("1. Individual risk Calculator:"),
               img(src='1.png', align = "center",width=650,
                   height= 550),
               img(src='2.png', align = "center",width=650,
                   height= 180),
               br(),
               h4("2. population risk Calculator and grapher:"),
               img(src='3.png', align = "center",width=650,
                   height= 550),
               br(),
               ( "PS: Upload data function still under development."),
               br(),
               h3("Contributors:"),
               tags$a( href = "https://github.com/Nour-Audi" ,"@Nour Audi"),
               tags$a( href = "https://github.com/kimaina", "@Allan Kimaina"),
               tags$a( href = "https://github.com/ilbsm7", "@Triet Tran " ),
               h3("Supervisor:"),
               tags$a( href = "http://sullivanstatistics.com/", "@Professor Sullivan " ),
  
               h3("License:"),
               (" This shiny is licensed under"),
               tags$a( href = "https://tldrlegal.com/license/mit-license#fulltext", "MIT License")

               )





    )
  )
)



