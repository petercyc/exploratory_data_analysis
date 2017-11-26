## Exploratory data analysis - Project 1

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
                    
# Plot 1
if(!dir.exists("plot")) dir.create("plot")
png(filename = "./plot/plot1.png", width = 480, height = 480, units = "px")
with(ldata, hist(Global_active_power, xlab = 'Global Active Power (kilowatt)', 
     main = 'Global Active Power', col = 'red'))
dev.off()
