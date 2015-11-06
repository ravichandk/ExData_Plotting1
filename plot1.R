#read data from text
data <- read.table("household_power_consumption.txt", header = TRUE,
                   sep=";", stringsAsFactors = FALSE, dec=".");

#filering out data for two days
subsetData <- data[data$Date %in% c("1/2/2007", "2/2/2007")];

#converting global active power data to numerics
globalActivePower <- as.numeric(subsetData$Global_active_power);

#changing the device mode and creating a new png file
png("plot1.png", height = 480, width = 480);

#plotting the data
hist(globalActivePower, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "RED")

dev.off()