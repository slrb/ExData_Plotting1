# plot3.R
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
png("plot3.png", width=480, height=480)

# Create the plot
plot(dateTime, febData$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(dateTime, febData$Sub_metering_2, col="red")
lines(dateTime, febData$Sub_metering_3, col="blue")
legend("topright", lty = 1, col=c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Close the device
dev.off()
