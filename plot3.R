colclasses = c("character", "character", rep("numeric",7))
data <- read.csv("household_power_consumption.txt", colClasses = colclasses, na.strings=c("?"), sep=";")
# Convert DateTime (character) to a real Date
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

data <- subset(data, DateTime >= as.POSIXct("2007-02-01") & DateTime < as.POSIXct("2007-02-03"))

# Plot 3
png(filename="plot3.png", width = 480, height = 480)
with(data, plot(DateTime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3))))
with(data, lines(DateTime, Sub_metering_2, col="red", ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3))))
with(data, lines(DateTime, Sub_metering_3, col="blue", ylim=range(c(Sub_metering_1,Sub_metering_2,Sub_metering_3))))
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1,  col=c("black","red","blue"))
dev.off()