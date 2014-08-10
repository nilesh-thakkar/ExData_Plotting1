data <- read.table(file = "household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)
data$Date <- as.Date(x = data$Date, format = "%d/%m/%Y")

data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]
dateandtime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480)
plot(x = dateandtime, y = as.numeric(data$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()