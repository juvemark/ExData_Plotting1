colclasses = c("character", "character", rep("numeric",7))
data <- read.csv("household_power_consumption.txt", colClasses = colclasses, na.strings=c("?"), sep=";")
# Convert DateTime (character) to a real Date
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data <- subset(data, DateTime >= as.POSIXct("2007-02-01") & DateTime < as.POSIXct("2007-02-03"))

# Plot 2
png(filename="plot2.png", width = 480, height = 480)
with(data, plot(DateTime, Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()