---
title       : UK Income Tax and National Insurance Calculator
subtitle    : Developing Data Products course by Johns Hopkins University on Coursera
author      : Marek Kluczynski
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction

The course assignment for the Developing Data Products course by Johns Hopkins University on Coursera was to build a simple Shiny application in a very short space of time. 

The key requirements were as follows

1. There should be some form of input (widget: textbox, radio button, checkbox, ...)
2. There should be some operation on the ui input in sever.R
3. There should be some reactive output displayed as a result of server calculations
4. You must also include enough documentation so that a novice user could use your application.
5. The documentation should be at the Shiny website itself and not via an external link.

These slides pitch the application that was built for this assignment.

--- .class #id 

## Application Premise

The application i choose to build was a basic UK Income Tax and National Insurance Calculator. 

The logic implement in the applicaiton was source from UK Goverment websites and can be found at http://bit.ly/1yTN3HD and http://bit.ly/1uztjM2 (correct as at 10/06/2016).

It should be noted the following assumptions apply to the calculation

1. The calculation is based on an input of GB Pounds.
2. The calculation only takes account of a persons wage and pension contribution.
3. The application does not take account of things like rental income, additional benefits, tax releif, other employement benefits, income from savings or invesments etc.

--- .class #id 

## Example Calculation

A worked example of the calculation will be for Bill. Let's assume Bill earns £50k per year and contributes 2% to his pension


```
##                   Item CashAmount
## 1   Personal Allowance   11000.00
## 2        Pay After Tax   29798.00
## 3       Basic Tax Rate    6400.00
## 4 Additional Tax Rate        0.00
## 5      Higher Tax Rate    2800.00
## 6    National Insurace    4333.28
## 7 Pension Contribution    1000.00
## 8           Total Wage   50000.00
```
The above calculation is implemented in the Server.R code. It should be noted that calculation has a few bugs with the logic and the numbers don't currently balance, this was due to time constraints.

--- .class #id 

## Application Implementation

The application has been implemented using shiny and Google Charts, specially a table and donut chart.

With regards to the requirements the assignment specified

1. There are input controls in the form of two numeric input boxes, one for wage and one for pension contribution percentage.
2. There is operation on the UI in Server.R as the Server writes out to output variables.
3. There is some reactive output displayed as a result of the server calculations. The calculation performed is the Tax and NI calculation, this is then fed back to a  google chart and table.
4. A short narrative has been written to instruct a user how to use the app.
5. The narrative has been implemented in both this document AND the app itself.
