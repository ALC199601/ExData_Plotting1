## create directory

if (!file.exists("data")) {
  dir.create("data")
}

setwd("./data")
##  download and unzip
  
file.url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip' 
download.file(file.url,destfile='power_consumption.zip') 

unzip('./power_consumption.zip',exdir='.',overwrite=TRUE) 
  