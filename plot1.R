# plot1.R
# Assume the data set is present in the working directory

# Read in the data 
allData <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

# Subset to include the 2-day period of interest in February 2007 (2007-02-01, 2007-02-02)
febData <- allData[allData$Date %in% c("1/2/2007", "2/2/2007"), ]

# Send a copy to the output file
png("plot1.png", width=480, height=480)

# Create the histogram 
hist(febData$Global_active_power, col = "red", 
     main="Global Active Power", xlab = "Global Active Power (kilowatts)")

# Close the PNG device
dev.off()

