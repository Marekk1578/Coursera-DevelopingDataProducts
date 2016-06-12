require(shiny)
myPlot <- c(1,2,3,4,5,6,7)
shinyUI(pageWithSidebar(
        headerPanel("UK Income Tax and National Insurance Calculator"),
        sidebarPanel(
                p('This app has been written as part an assignment for the The Developing Data Products course by Johns Hopkins University on Coursera.'),
                h2('Calculation Inputs'),
                numericInput('wage', 'Wage in GBP',30000, min=0, max=10000000, step=1),
                numericInput('pension', '% Wage to Pension (0-100)',5, min=0, max=100, step=0.01),
                h1(''),
                p('Disclaimer: This app has been written as part of a university assignment and as such should not be used to formally calculate tax as there are known bugs with the calculation')
        ),
        mainPanel(
                 p('This app calculates Income Tax and National Insurance due on Wages of UK residents. The calculator only takes into account Wages and Pension contributions and does not take into account rental income, additional benefits offered from an employer (e.g. private health), income from a trust, income from any savings or investments or other benefits.'),
                 p('To do a calculation please enter your gross wage in GBP and percentage of your wage before tax (as number between 0-100) that you contribute to your pension.'),
                 h3('Calculation Output'),
                 tabsetPanel(
                         tabPanel("Chart", htmlOutput("mmdounuts")),
                         tabPanel("Summary Table", htmlOutput("resulttable"))
                         
                 )
                
        )
        
))