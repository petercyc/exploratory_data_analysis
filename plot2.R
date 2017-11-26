# load library
library(dplyr)
library(data.table)

# download, unzip and read data
setwd("D:/Data Science course/Exploratory-data-analysis/data")
dataset <- 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(dataset,destfile = 'household_power_consumption.zip')
unzip('household_power_consumption.zip')
fn <- file("household_power_consumption.txt")
ldata <- read.table(text = grep("^[1,2]/2/2007",readLines(fn),value=TRUE), 
        sep = ';', col.names = c("Date", "Time", "Global_active_power", 
         "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", 
         "Sub_metering_2", "Sub_metering_3"), na.strings = '?')

# Plot 2
# create new colume that combine date and time data
ldata$timestamp <- paste(ldata$Date, ldata$Time)
timedate <- strptime(ldata$timestamp, "%d/%m/%Y %H:%M:%S")
if(!dir.exists("plot")) dir.create("plot")
png(filename = "./plot/plot2.png", width = 480, height = 480, units = "px")
plot(timedate, ldata$Global_active_power, type = "l", xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()