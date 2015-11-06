#read data from text
data <- read.table("household_power_consumption.txt", header = TRUE,
                   sep=";", stringsAsFactors = FALSE, dec=".")

#filering out data for two days
subsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007")]

#converting  data to numerics
globalActivePower <- as.numeric(subsetData$Global_active_power)
globalReactivePower <- as.numeric(subsetData$Global_reactive_power)
globalVoltage <- as.numeric(subsetData$Voltage)

#format the date and time
dates <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), 
                  "%d/%m/%Y %H:%M:%S")

energySubMeter1 <- as.numeric(subsetData$Sub_metering_1)
energySubMeter2 <- as.numeric(subsetData$Sub_metering_2)
energySubMeter3 <- as.numeric(subsetData$Sub_metering_3)

#changing the device mode and creating a new png file
png("plot4.png", height = 480, width = 480)

par(mfrow = c(2,2))

#plot Global Active Power
plot(dates, globalActivePower, type = "l", 
     ylab = "Global Active Power", xlab="")

#plot voltage
plot(dates, globalVoltage, type = "l", ylab = "voltage", xlab="datetime")

#plot the first engergy meter
plot(dates, energySubMeter1, type="l", ylab = "Energy Sub Metering", xlab="")
#plot the second energy meter as a another line in the above plot
lines(dates, energySubMeter2, type="l", col="RED")
#plot the third energy meter as a another line in the above plot
lines(dates, energySubMeter3, type="l", col="BLUE")

#add legends
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1,lwd=2.5,    col=c("BLACK", "RED", "BLUE"))

#plot Global Active Power
plot(dates, globalReactivePower, type = "l", 
     ylab = "Global_reactive_power", xlab="")


dev.off()