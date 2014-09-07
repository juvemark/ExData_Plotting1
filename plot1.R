# Read data from text file
colclasses = c("character", "character", rep("numeric",7))
data <- read.csv("household_power_consumption.txt", header=TRUE, colClasses = colclasses, na.strings=c("?"), sep=";")
# Convert DateTime (character) to a real Date
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data <- subset(data, DateTime >= as.POSIXct("2007-02-01") & DateTime < as.POSIXct("2007-02-03"))

# Plot 1
png(filename="plot1.png", width = 480, height = 480)
hist(as.numeric(data$Global_active_power), xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.off()
