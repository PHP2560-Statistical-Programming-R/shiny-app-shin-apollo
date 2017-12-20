## Shiny App: CVD 10 risk calculator 
#### Type: shiny application
#### Title: a calculator for Cardiovascular Diseases risk. Based on frisk package that utilize framingham study based risk scores calculation. 
#### Version: 0.1.0
#### Authors:
    person("Allan"   , "Kimaina", "allan_kimaina@brown.edu"), 
    person("MHD Nour", "Audi"   ,"MHD_Nour_audi@brown.edu"),
    person("Triet"   , "Tran"   , "triet_tran@brown.edu"))
#### Supervisor:  Professor Sullivan: http://sullivanstatistics.com/

### Introduction: 
CVD Risk App is a shiny app that utilize [frisk R package](https://github.com/PHP2560-Statistical-Programming-R/r-framingham) to estimate projected 10 years Cardiovascular Diseases(CVD) risk based on:
[framinghamheartstudy.org](https://www.framinghamheartstudy.org/risk-functions/cardiovascular-disease/10-year-risk.php)
            .This app is used to calculate framingham study risk scores for individual and a whole population with visualization. This shiny app utilize frisk package and present visualizations helping non-R professionals to calculate
 Framingham risk scores for one patient or a whole clinical center database. 
 
!["Individual risk Calculator"](www/1.png?raw=true)

### Clinical background:

Predicting cardiovascular diseases & risk factors impact is one of the main concerns for physiciens.
being able to predict patient risk factors impact on his CAD risk guid physiciens and patients in their efforts to prevent CAD.
one of the most popular and longest studies is Framingham heart study which have been ongoing since 1948.
following people for long period of time to estimate which factors impacted their CAD incidence risk. 
The study was able to create a risk prediction functions for several health outcomes. 
On of the most clinically utilized function is CAD 10 years risk predictor based on study conducted in 2008.



### R-Package frisk:
We created an R package that utilize Framingham CAD 10 risk: [frisk package R source code](https://github.com/PHP2560-Statistical-Programming-R/r-framingham).
the package have two main functions at the moment:

1. calc_card_10: a function that take patients risk factors dataframe and predict;
       total risk points, CAD 10 risk and heart age (the age of a person with the same
                    predicted risk but with all other risk factor levels in normal ranges).

2. calc_card_10_one: a function that predict Framingham CAD 10 years risk for individual patients,
    it have the same output as calc_card_10 along with risk point estimation for every risk factor. 
         Allowing the patient and his physicien to know how every risk factor is impacting patient CAD risk. 
         

License: MIT license



