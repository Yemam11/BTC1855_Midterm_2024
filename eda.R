#Creating an EDA of the data


#loading packages
library(funModeling) 
library(tidyverse) 
library(Hmisc)

#Defining a function to do the eda
basic_eda <- function(data) {
  glimpse(data)
  print(status(data))
  freq(data) 
  print(profiling_num(data))
  plot_num(data)
  describe(data)
}