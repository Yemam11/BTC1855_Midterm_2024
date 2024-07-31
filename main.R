# BTC1855 Midterm 2024
# Description: Main script
# Author Youssef Emam
# Set the wd to the repo homepage to run



#Import datasets
stations <- read.csv("datasets/station.csv")
trips <- read.csv("datasets/trip.csv")
weather <- read.csv("datasets/weather.csv")

#Load EDA funcitons
source("eda.R")

#running EDAs
basic_eda(stations)
basic_eda(trips)
basic_eda(weather)