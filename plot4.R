# plot4.R
# Assume the data set is present in the working directory

# Read in the data 
allData <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Subset to include the 2-day period of interest in February 2007 (2007-02-01, 2007-02-02)
febData <- allData[allData$Date %in% c("1/2/2007", "2/2/2007"), ]

# Create a variable that combines the date and time
febData$Date <- as.Date(febData$Date, format="%d/%m/%Y")
dateTime <- paste(febData$Date, febData$Time, sep = " ")
dateTime <- strptime(dateTime, format ="%Y-%m-%d %H:%M:%S")

# Send a copy to the output file
png("plot4.png", width=480, height=480)

# Create the plots
par(mfrow = c(2,2))
# Plot 1
plot(dateTime, febData$Global_active_power, type="l", ylab = "Global Active Power", xlab = "")
# Plot 2  
plot(dateTime, febData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
# Plot 3    
plot(dateTime, febData$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(dateTime, febData$Sub_metering_2, col="red")
lines(dateTime, febData$Sub_metering_3, col="blue")
legend("topright", lty = 1, bty = "n", col=c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Plot 4
plot(dateTime, febData$Global_reactive_power, type="l", 
     ylab = "Global_reactive_power", xlab = "datetime")

# Close the device
dev.off()
