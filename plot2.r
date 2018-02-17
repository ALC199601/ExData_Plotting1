library(dplyr)
library(lubridate)
source("get_data.R")
# Read Data

datafile <- read.table("household_power_consumption.txt", header = TRUE, 
                       sep = ";", na = "?")
## Convert date and time

datafile$Range<- as.Date(datafile$Date, format = "%d/%m/%Y")
## datafile$Time <- strptime(datafile$Time, format = "%H:%M:%S")

## create a date and time variable

datafile$Date_Time<-dmy(datafile$Date)+hms(datafile$Time)


# Use dates 2007-02-01 and 2007-02-02

reduced_data <- subset(datafile, datafile$Range >= "2007-02-01" &  
                         datafile$Range <="2007-02-02")
#create plot

plot(reduced_data$Date_Time, reduced_data$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", type = "l")

## Copy the plot to a PNG file

dev.copy(png, file = "plot2.png", width = 480, height = 480) 

## close the PNG device

dev.off() 

