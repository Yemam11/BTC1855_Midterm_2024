# BTC1855 Midterm 2024
# Description: Main script
# Author Youssef Emam
# Set the wd to the repo homepage to run



#Import datasets
stations <- read.csv("datasets/station.csv")
trips <- read.csv("datasets/trip.csv")
weather <- read.csv("datasets/weather.csv")

#=============== EDA ===============#

source("eda.R")

#running EDAs
basic_eda(stations)
basic_eda(trips)
basic_eda(weather)


#customized EDA

#Find out how many trips start and stop at each station (traffic)
stations_summary <- trips %>% 
  group_by(start_station_id) %>% 
  summarise(start_trips = n())


stations_summary <- trips %>% 
  group_by(end_station_id) %>% 
  summarise(end_trips = n()) %>%
  ungroup() %>% 
  left_join(stations_summary, join_by("end_station_id" == "start_station_id")) %>%
  left_join(stations, join_by("end_station_id" == "id")) %>% 
  group_by(end_station_id) %>%
  mutate(traffic = sum(start_trips) + sum(end_trips))


#create a figure that summarizes station data
library(ggplot2)
ggplot(data = stations_summary, mapping = aes(x = reorder(name, traffic), y = traffic, fill = traffic)) +
  geom_col() +
  coord_flip()+
  theme(axis.text.y = element_text(size = 5, vjust = 0.5))+
  labs(y = "Traffic", x = "Station")


#Summarise trips by mean duration over the course of the year
trips_summary <- trips %>%
  mutate(start_date = mdy_hm(start_date, tz = "UTC"),
         month = month(start_date, label = T)) %>% 
  group_by(month) %>% 
  summarise(average_trip = mean(duration, na.rm = T))

#plot the summary
# Seems to be outliers, we will deal with this later
ggplot(data = trips_summary, mapping = aes(x = month, y = average_trip, group = 1))+
  geom_line()+
  labs(y = "Average Trip Duration (Seconds)", x = "Month", title = "Average Trip Duration by Month") +
  theme_classic()+
  theme(plot.title = element_text(hjust = 0.5),
        panel.grid.major.y = element_line(color = "gray", linetype = "dashed")) +
  geom_label(aes(label = round(average_trip, 0)),
             vjust = -0.5,
             size = 2)
  

#summarise the weather data
weather_summary <- weather %>%
  mutate(month = month(mdy(date), label = T)) %>% 
  group_by(month, city) %>% 
  summarise(precip = sum(as.numeric(precipitation_inches), na.rm = T)) %>% 
  ungroup()


#plot a summary
ggplot(data = weather_summary, mapping = aes(x = month, y = precip, color = city, group = city))+
  geom_line() +
  labs(y = "Total Precipitation by Month (In)", x = "Month", title = "Total Precipitation")+
  theme(plot.title = element_text(hjust = 0.5))
         
#=============== Data Cleaning ===============#

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
summary(weather)

#convert dates to posixct
weather$date <- mdy(weather$date, tz = "UTC")

#convert city, events to factors

unique(weather$city)

#there are some empty values
unique(weather$events)

#convert to NA
weather$events[weather$events == ""] <-NA

weather$city <- as.factor(weather$city)
weather$events <- as.factor(weather$events)

#identify anomolies in precipitation column

#Smallest value that is non-zero is 0.01. "T" represents any value that is less than 0.01
sort(as.numeric(unique(weather$precipitation_inches)), decreasing = F)

#Set the Trace values as numeric 0.005
weather$precipitation_inches[weather$precipitation_inches == "T"] <- 0.005

#convert the values to numeric
weather$precipitation_inches <- as.numeric(weather$precipitation_inches)

#convert cloud cover to factor, and set levels since its a scale and not a measurement
weather$cloud_cover <- as.factor(weather$cloud_cover)



#=============== Rush Hour Analysis ===============#


#load libraries
library(ggplot2)
library(scales)

#Identify highest traffic times on weekdays

#identify when a trip begins during a weekday
#create a copy of the data set with a new column that contains day of the week
weekdays <- trips
weekdays$DOW <- as.factor(weekdays.POSIXt(weekdays$start_date))

#find the midpoint for each trip
weekdays$midpoint <- weekdays$start_date + (weekdays$end_date - weekdays$start_date)/2
#set the date to be the same day for all trips, makes it easy to plot and compare later
date(weekdays$midpoint) <- as.Date("2000-01-01")


#Create 2 dfs for weekends and weekdays

#filter to include only weekends
weekends <- weekdays %>%
  filter(DOW %in% c("Saturday", "Sunday"))

#filter to only include weekdays
weekdays <- weekdays %>%
  filter(!DOW %in% c("Saturday", "Sunday"))




#calculate the mean frequency of trips
#anything above this should be considered "rush hour" (i.e it means people are using bikes more than average)
meanfreq = nrow(weekdays)/48

#plot results
ggplot(weekdays, mapping = aes(x = midpoint)) +
  geom_histogram(fill = "lightseagreen", bins = 48) +
  scale_x_datetime(date_labels = "%H:%S", breaks = "1 hour", minor_breaks = "30 min") +
  theme(axis.text.x = element_text(size=7, angle = 70, vjust = 0.5),
        plot.title = element_text(hjust = 0.5)) +
  geom_hline(yintercept = meanfreq) +
  labs(title = "Trip Frequency by Hour", y = "Trips", x = "Time of Day")

#rush hours seem to be 7-10:30am and 4-8pm
#create a df with rush hour boundaries
rushhr <- data.frame(early = c("07:00:00", "10:30:00"), late = c("16:00:00", "20:00:00"))

#convert to times, and set the date to 2000-01-01 to be able to compare with midpoint
rushhr$early <- strptime(rushhr$early, format = "%H:%M", tz = "UTC")
date(rushhr$early) <- as.Date("2000-01-01")
rushhr$late <- strptime(rushhr$late, format = "%H:%M", tz = "UTC")
date(rushhr$late) <- as.Date("2000-01-01")


#determine 10 most frequent starting locations during rush hours
locations_wkdy <- weekdays %>%
  filter((midpoint >= rushhr$early[1] & midpoint <= rushhr$early[2]) |
  (midpoint >= rushhr$late[1] & midpoint <= rushhr$late[2])) %>% 
  group_by(start_station_name) %>% 
  summarise(number = n()) %>% 
  arrange(desc(number)) %>% 
  head(10)

#determine 10 most frequent starting locations on weekends
locations_wknd <- weekends %>% 
  group_by(start_station_name) %>% 
  summarise(number = n()) %>% 
  arrange(desc(number)) %>% 
  head(10)


#calculate average utilization per month
months <- trips

#add month column to copy of data
months <- months %>%
  mutate(month = month(start_date, label = T))

#calculate utilization per month (total time used in the month/seconds in a month)
utilization <- months %>%
  group_by(month) %>% 
  summarise(utilizaiton = (sum(duration)/2592000)) %>% 
  ungroup

# Alternativley
# The total number of possible seconds = number of bikes x number of seconds in the month
# dividing this by the total trip duration per month tells us how much of the possible maximum duration we are using
# this can be interpreted as a measure of the bike rental system utilization
percent_utilization <- months %>%
  group_by(month) %>%
  #calculate the number of bikes within each group, so we only include bikes that go on trips in our estimate
  summarise(system_utilization = (sum(duration)/((as.integer(length(unique(months$bike_id)))*2592000))*100)) %>% 
  ungroup()

#plot
percent_utilization %>% 
  ggplot(mapping = aes(x = month, y= system_utilization, fill = system_utilization)) +
  geom_col() + 
  scale_fill_gradient(low = "red", high = "forestgreen", name = "System Utilization (%)")+
  labs(title = "Bike Rental System Utilization (%)",
       y = "",
       x = "Month")+
  theme(plot.title = element_text(hjust = 0.5),
        legend.position = "left",
        legend.title = element_text(hjust = 0.5, angle = 90),
        legend.title.position = "right")



#=============== Rush Hour Analysis ===============#

#combine trips dataset with weather dataset
# identify columns to join on

#shared columns are zipcode and date

# create a standardized date column to join on by removing the time from the start_date column
joined_data <- trips %>%
  mutate(date = date(start_date))

#Add city column by joining the stations data set
joined_data <- left_join(joined_data, stations, by = join_by("start_station_id" == "id"))

#investigate how the weather affects bike usage
library(corrplot)
library(Hmisc)

# create df with data to summarize
# we will analyze each day, within each city, and join the weather for that date + city
joined_data_numeric <- joined_data %>% 
  group_by(city, date) %>% 
  summarise(total_trip_time = sum(duration),
            number_of_trips = n()) %>% 
  left_join(weather, by = join_by("city"=="city", "date"=="date")) %>% 
  ungroup() %>% 
  select(!zip_code)

#corrplot for each city
par(xpd=TRUE, mfrow = c(1,1))
for(i in unique(joined_data_numeric$city)){
  
  #create correlation matrix for the city
  cor_data <- joined_data_numeric %>%
    filter(city == i) %>% 
    select_if(is.numeric)
  
  #computes correlation values and p-values for the data
  cor_plot <- rcorr(as.matrix(cor_data))
  
  #clean the matrix to remove redundancy
  
  cor_plot$r <- cor_plot$r[1:2, c(-1,-2)]
  cor_plot$P <- cor_plot$P[1:2, c(-1,-2)]
  
  
  #plot the matrix, hide insignificant results (i.e H0: pearson coefficient = 0)
  corrplot(cor_plot$r, method = "shade", title = i, p.mat = cor_plot$P, sig.level = 0.05,insig = "blank",tl.col = "black", tl.srt = 50, cl.pos = "b", cl.ratio = 0.7, mar = c(2, 2, 2, 5))
}
