# Framingham Cardiovascular 10 Years Risk calculator:
##1. clinical background:

predicting cardiovascular diseases & risk factors impact is one of the main concerns for physicians.
being able to predict patient risk factors impact on his CAD risk guide physicians and patients in their efforts to prevent CAD.
one of the most popular and longest studies is Framingham heart study which have been ongoing since 1948.
following people for long period of time to estimate which factors impacted their CAD incidence risk. 
The study was able to create a risk prediction functions for several health outcomes. 
One of the most clinically utilized function is CAD 10 years risk predictor based on study conducted in 2008.

##2. frisk:
we created an R package that utilize Framingham CAD 10 risk.
the package has two main functions at the moment:
   1. calc_card_10: a function that take patients risk factors data frame and predict;
       total risk points, CAD 10 risk and heart age (the age of a person with the same
                    predicted risk but with all other risk factor levels in normal ranges).
   2. calc_card_10_one: a function that predict Framingham CAD 10 years risk for individual patients,
    it has the same output as calc_card_10 along with risk point estimation for every risk factor. 
         Allowing the patient and his physician to know how every risk factor is impacting patient CAD risk. 
         
##3. shiny cardiovascular 10 Years Risk calculator:
the shiny app utilizes frisk package and present visualizations helping non-R professionals to calculate
 Framingham risk scores for one patient or a whole clinical center database. 
 
##Instructions:
To use the app individual patient calculator, enter patient name, age, gender, Systolic Blood pressure, diagnosis of hypertension status, diagnosis of Diabetes Miletus status and current smoking status. Then decide withe to use BMI or lipid profile methodology. 

The graph will show each risk factor impact on total CHD 10 years estimated risk and total risk points. Also, a statement will be pasted that include patient name, estimated risk and heart age which is the age of a patient with exact estimated risk but without any risk factor.

##Targeted Users:
the app is simple enough to be used by any person who would like to check his CAD 10 years risk. Also, frisk package and the app upon further development could be used by clinicians and clinical institutions interested in calculating Framingham CAD 10 risk for its patients.  

##Contributors
in Alphabatical order and main contrinutions, the whole project wouldn't come to light without disscusions and inputs from whole team members.
###Allan Kimaina: 
###Nour Audi: original idea, coding the app about page, coding individual patient graph, part of frisk package functions coding and readme page
###Triet Tran: function to read index tables, function to convert point to risk and heart age, part of frisk package, code the UI for the shiny app and the input