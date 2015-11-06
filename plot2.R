#read data from text
data <- read.table("household_power_consumption.txt", header = TRUE,
                   sep=";", stringsAsFactors = FALSE, dec=".")

#filering out data for two days
subsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007")]

#converting global active power data to numerics
globalActivePower <- as.numeric(subsetData$Global_active_power)

#format the date and time
dates <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), 
                  "%d/%m/%Y %H:%M:%S")

#changing the device mode and creating a new png file
png("plot2.png", height = 480, width = 480)

#plot the data by mentioning the type as lines
plot(dates, globalActivePower, type = "l", 
     ylab = "Global Active Power (kilowatts)")

dev.off()