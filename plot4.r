library(dplyr)
library(lubridate)
# Read Data
source("get_data.R")

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

## set up for 2x2 plots

par(mfrow = c(2,2))

#create plot1

plot(reduced_data$Date_Time, reduced_data$Global_active_power, xlab = "", 
     ylab = "Global Active Power", type = "l")

#create plot2
plot(reduced_data$Date_Time, reduced_data$Voltage, xlab = "datetime", 
     ylab = "Voltage", type = "l")

#create plot3

plot(reduced_data$Date_Time, reduced_data$Sub_metering_1, type="l", 
     xlab='', ylab='Energy sub metering')
lines(reduced_data$Date_Time, reduced_data$Sub_metering_2, type="l", col = "red") 
lines(reduced_data$Date_Time, reduced_data$Sub_metering_3, type = "l", col = "blue") 

# create legend

meters <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend_colors <- c("black", "red", "blue")

legend('topright',legend=meters,col=legend_colors, lty = "solid")

##create plot 4

plot(reduced_data$Date_Time, reduced_data$Global_reactive_power, xlab = "datetime", 
     ylab = "Global_reactive_power", type = "l")
## Copy the plot to a PNG file

dev.copy(png, file = "plot4.png", width = 480, height = 480) 

## close the PNG device

dev.off() 

