library(dplyr)
library(lubridate)
source("get_data.R")
# Read Data

datafile <- read.table("household_power_consumption.txt", header = TRUE, 
                       sep = ";", na = "?")
# Convert date and time

datafile$Date <- as.Date(datafile$Date, format = "%d/%m/%Y")
datafile$Time <- strptime(datafile$Time, format = "%H:%M:%S")

# Use dates 2007-02-01 and 2007-02-02

reduced_data <- subset(datafile, datafile$Date >= "2007-02-01" &  
                         datafile$Date <="2007-02-02")
#create histogram

hist(reduced_data$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

## Copy the plot to a PNG file

dev.copy(png, file = "plot1.png", width = 480, height = 480) 

## close the PNG device

dev.off() 

