# Lab Assignments

These are my assignments:

| Assignments           | Date   | 
|-----------------------|------------|
| Lab #1                | 2024/01/25 | 
| Lab #2                | 2024/02/01 |
| Lab #3                | 2024/02/08 | 
| Lab #4                | 2024/02/15 |             
| Project Proposal     | 2024/02/22 |            
| Lab #5                | 2024/02/29 |             
| Lab #6                | 2024/03/07 |             
| Lab #7                | 2024/03/28 |             
| Lab #8                | 2024/04/04 |             
| Lab #9                | 2024/04/11 |             
| Lab #10               | 2024/04/18 |             
| Project Presentation  | 2024/05/02 |             
| Final Project         | 2024/05/10 |             

# Keyboard shortcut / Hot Key in R Studio
%>% ``Ctrl + Shift +M``

function details ``?sqrt``

<- ``alt + -``

# Notes from courses in Spring 2024

## Ch2
### import tools
``library("packages_name")``
### downloads the packages
``install.packages("packages_name")``
### point, like a = 3 in python 
``a <- 3``
### print couple numbers, kind of like for loop
``seq (from = 0, to = 100, by = 2)``
### make a diagram with package named yarr
``piratelot (formula = XXX, data = XXX, pal = XXX)``

## Ch3
### show the first couple datas 
``head(dataframe)``
###  column, attributes
``names(dataframe)``
### show a window with data table which will looks like excel
``view(dataframe)``
### simple math calculation
``mean(x = dataframe$colume), max(x = dataframe$colume)``
### make a simple diagram
``plot(x = dataframe$colume, y = datafram2$column)``
### combine two dataframes
By Row
``rbind(dataframeA, dataframeB)``
By Cow
``cbind(dataframeA, dataframeB)``

## Ch5
### Scalars vs. Vectors
The concept is 1-dimentional and 2-dimentional arrays no matter in python or in C.
#### How to use "Scalars"?
We can assign number, strings, character, and so on.
``a <- 10``

``b <- "ship"``

#### How to use "Vectors"?
c means "create".

``e <- c(1, 5, 9)``

### What's Dataframe?
> a = 1 : 3
> 
> b = c(T, T, F)
> 
> c = c("A", "B", "C")
> 
> d = data.frame(a, b, c)

This dataframe will be like the following.
|  | a | b | c |
|---|---|---|---|
| 1 | 1 | True | A |
| 2 | 2 | True | B |
| 3 | 3 | False | C |


## Tidyverse packages
| Usage           | code   | 
|-----------------|--------|
|visulization | ``ggplot2`` |
|data processing | ``dplyr`` |
|exchange the col and row | ``tidyr`` |
|load data | `` readr `` |
|accelerator that eliminates loops | ``purrr`` |
| enhance the dataframe | ``tibble`` |

## Useful functions
| Usage           | code   | 
|-----------------|--------|
| the numbers of col and row | ``dim()`` |
| show the top 6 data | ``head()`` |
| show th last 6 data | ``tail()`` |
| names of col | ``colunames()`` |
| statistic descriptions | ``summary()`` |
| check how the data looks like now | ``glimpse()`` |
| structure information | ``str()`` |










