# plot2.R
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
png("plot2.png", width=480, height=480)

# Create the plot on the screen device
plot(dateTime, febData$Global_active_power, type="l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

# Close the PNG device
dev.off()
