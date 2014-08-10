data <- read.table(file = "household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)
data$Date <- as.Date(x = data$Date, format = "%d/%m/%Y")

data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]
dateandtime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2), mar = c(4,4,2,1))

plot(x = dateandtime, y = as.numeric(data$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(x = dateandtime, y = as.numeric(data$Voltage), type = "l", xlab = "datetime", ylab = "Voltage")

plot(x = dateandtime, y = as.numeric(data$Sub_metering_1), type = "l", xlab = "", ylab = "Energy sub metering")
lines(x = dateandtime, y = as.numeric(data$Sub_metering_2), col = "red")
lines(x = dateandtime, y = as.numeric(data$Sub_metering_3), col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

plot(x = dateandtime, y = as.numeric(data$Global_reactive_power), type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()