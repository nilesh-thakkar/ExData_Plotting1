data <- read.table(file = "household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, header = TRUE)
data$Date <- as.Date(x = data$Date, format = "%d/%m/%Y")

data <- data[data$Date >= as.Date("2007-02-01") & data$Date <= as.Date("2007-02-02"),]
png(filename = "plot1.png", width = 480, height = 480)
hist(as.numeric(data$Global_active_power), col = "red", xlab = "Global Active Power(kilowatts)", ylab = "Frequency", main = "Global Active Power")
dev.off()