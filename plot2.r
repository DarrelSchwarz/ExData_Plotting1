##
## Coursera: Exploratory Data Analysis - Week 1 Project - Plot 2
##
## File downloaded from "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
## dateDownloaded "Fri Jun 07 15:42:29 2019 AEST"
##
## Win10 Pro Version	10.0.17134 Build 17134
##

hpcData <- read.csv(unz(".\\data\\household_power_consumption.zip", "household_power_consumption.txt"),header=TRUE,sep=";",na.strings="?",dec=".")

hpcData$Date <- as.Date(hpcData$Date, "%d/%m/%Y")

#select dates 2007-02-01 and 2007-02-02
data <- subset(hpcData, Date>="2007-02-01" & Date<="2007-02-02")

#create datetime
data$datetime <- as.POSIXct(paste(data$Date,data$Time))

#Create Graph
png(file = "plot2.png",width=480,height=480)

par(mfrow = c(1,1), mar= c(4,4,2,1))

plot(data$Global_active_power~data$datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
