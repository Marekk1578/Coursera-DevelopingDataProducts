TaxCalc <- function(Wage, PensionPercentage, pie)
{
        
        #Set Tax Rates
        PersonalAllowance <- 11000
        Basic <- 0 
        Additional <- 0 
        Higher <- 0 
        NI <- 0        
        
        #Calculate Pension Contribution
        Pension <- Wage * (PensionPercentage/100)
        if(Pension>0){Wage<- Wage - Pension}
        
        #Check if Wage is less than personal allowance
        if(Wage<11000){ PersonalAllowance <- Wage}
        
        #Check is Personal Allowance Applies
        if(Wage>= 122000 ){ PersonalAllowance <- 0}
        
        #Check if Basic Wage of Tax Applies
        if(Wage>=11000)
        {
                if(Wage<=43000) {Basic <- (Wage - 11000) * 0.2}
                if(Wage>43000)  {Basic <- (43000 - 11000) * 0.2}
        }
        
        #Check if Higher Rate of Tax Applies
        if(Wage>43000)
        {
                if(Wage<=150000) {Higher <- (Wage - 43000) * 0.4}
                if(Wage>150000) {Higher <- (150000 - 43000) * 0.4}
        }
        
        #Check if Additional Rate of Tax Applies
        if(Wage >150000) {Additional <- (Wage - 150000) * 0.45}
        
        #Calculate National Insurance
        WeeklyWage <- Wage / 52
        WageNI <- (Wage- 8060)
        if(WeeklyWage>155)
        {
                if(WeeklyWage<827) { NI <- WageNI *0.12 }
                if(WeeklyWage>=827) { 
                        NI <- ((827 - (8060/52))*52)*0.12
                        NI <- NI + (Wage - 43000)*0.02
                }
        }

        #Calculate Pension Contribution
        #Pension <- Wage * (PensionPercentage/100)
        
        #Calculate Take Home Less Personal Allowance
        TakeHome <- Wage - Basic - Additional - Higher - PensionPercentage - PersonalAllowance
        if(TakeHome<0) {TakeHome<-0}
        
        #Put Data into DataFrame
        Item <- c('Personal Allowance', 'Pay After Tax', 'Basic Tax Rate', 
                  'Additional Tax Rate ', 'Higher Tax Rate', 
                  'National Insurace',  'Pension Contribution', 'Total Wage')
        TaxTable <- as.data.frame(Item)
        Wage <- Wage + Pension
        TaxTable$CashAmount <- c(PersonalAllowance, TakeHome, Basic, Additional, Higher, NI, Pension, Wage)
        
        myPlot <- c(1,2, 3,4,5,6,7)
        if(pie<1) {return(TaxTable)}
        if(pie>0) {return(TaxTable[myPlot,])}
        
}


suppressPackageStartupMessages(library(googleVis))
library(shiny)
library(datasets)

shinyServer(function(input, output) {
        
        datasetInput <- reactive({
                TaxCalc({input$wage},{input$pension},0)
        })
        datasetInputPie <- reactive({
                TaxCalc({input$wage},{input$pension},1)
        })
        
        output$mmdounuts <- renderGvis({
                
                gvisPieChart(datasetInputPie(), 
                             options=list(
                                     width=500,
                                     height=500,
                                     title='UK PAYE Wage Deductions',
                                     colors="['orange','gray','brown', 'red', 'pink', 'green', 'yellow','blue','purple' ]",
                                     pieHole=0.5),
                             chartid="doughnut")
        })

        output$resulttable <- renderGvis({gvisTable(datasetInput(), formats=list(CashAmount="#,###"))})                               
})
         
