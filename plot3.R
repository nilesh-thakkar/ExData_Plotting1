data <- read.table(file = "household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)
data$Date <- as.Date(x = data$Date, format = "%d/%m/%Y")

data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]
dateandtime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480)
plot(x = dateandtime, y = as.numeric(data$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = dateandtime, y = as.numeric(data$Sub_metering_2), col = "red")
lines(x = dateandtime, y = as.numeric(data$Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)
dev.off()