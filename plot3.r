##
## Coursera: Exploratory Data Analysis - Week 1 Project - Plot 3
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
png(file = "plot3.png",width=480,height=480)

par(mfrow = c(1,1), mar= c(4,4,2,1))

with(data, plot(datetime,Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab=""))
with(data, points(datetime,Sub_metering_2, type="l",col = "red"))
with(data, points(datetime,Sub_metering_3, type="l",col = "blue"))
legend("topright", lty=1 , col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_2"))

dev.off()
