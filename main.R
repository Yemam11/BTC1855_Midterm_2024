# BTC1855 Midterm 2024
# Description: Main script
# Author Youssef Emam


#Import datasets
stations <- read.csv("station.csv")
trips <- read.csv("trip.csv")
weather <- read.csv("weather.csv")

#import libraries
library(lubridate)
library(tidyverse)

# Clean the stations dataset

#no NAs
apply(is.na(stations), 2, sum)

# Summarize the data
# doesnt seem to have any outliers
summary(stations)

#convert installation date to posixct format
stations$installation_date <- mdy(stations$installation_date, tz = "UTC")


