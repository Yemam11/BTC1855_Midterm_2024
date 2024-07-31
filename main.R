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

#clean the trips data set

#No NAs
apply(is.na(trips), 2, sum)

#look for anomolies in the data

#summarize the data
summary(trips)

#convert dates to posixct format
trips <- trips %>%
  mutate(start_date = mdy_hm(start_date, tz = "UTC"),
         end_date = mdy_hm(end_date, tz = "UTC"))

#convert character columns to factors
trips <- trips %>%
  mutate(across(.cols = c(start_station_name, end_station_name, subscription_type), .fns = as.factor))

#identify any-non numeric data in zip-code
nonnum <- grepl(x = trips$zip_code, pattern = "[^0-9]")

#convert that data to NA
trips$zip_code[nonnum] <- NA

#identify any empty characters, and covnert to NA
trips$zip_code[which(trips$zip_code == "")] <- NA

#convert zip codes to integer
trips$zip_code <- as.integer(trips$zip_code)

sum(!is.na(trips$zip_cod))

#remove any values outside of the valid zip code range (00501- 99950)
trips$zip_code[trips$zip_code > 99950 | trips$zip_code < 501] <- NA

#remove outliers from the data

#find trips less than 3 mins in duration, that start and end at the same place
cancelled_trips <- trips %>%
  filter(duration < 180) %>%
  filter(start_station_name == end_station_name)

#remove from data set
trips <- trips %>% 
  filter(!(trips$id %in% cancelled_trips$id))

#identify trips that are too long
# Lets assume that the longest possible trip is one day, i.e 86400 seconds
outliers <- trips %>% 
  filter(duration > 86400)

#Remove them from the data set
trips <- trips %>% 
  filter(!(trips$id %in% outliers$id))

#clean weather dataset

