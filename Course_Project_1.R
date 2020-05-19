## load table and using data from the dates 2007-02-01 and 2007-02-02
householdPower <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
dates <- householdPower[householdPower$Date %in% c("01/02/2007", "02/02/2007"), ]
times <- strptime(paste(dates$Date, dates$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
dates <- cbind(times, dates)

## create plot 1
hist(dates$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")

## save plot 1 and close dev
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()

## create plot 2
plot(dates$times, dates$Global_active_power, type = "l", col = "black", xlab = " ", ylab = "Global Active Power (kilowatts)")

## save plot 2 and close dev
dev.copy(png, "plot2.png", width = 480, height = 480)
dev.off()

## create plot 3
plot (dates$times, dates$Sub_metering_1, type = "l", col = "black", xlab = " ", ylab = "Energy sun metering")
lines(dates$times, dates$Sub_metering_2, col = "red")
lines(dates$times, dates$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = "solid")

## save plot 3 and close dev
dev.copy(png, "plot3.png", width = 480, height = 480)
dev.off()

## create plot 4
par(mfrow = c(2, 2))
plot(dates$times, dates$Global_active_power, type = "l", col = "black", xlab = " ", ylab = "Global Active Power")
plot(dates$times, dates$Voltage, type = "l", col = "black", xlab = "datetime", ylab = "Voltage")
plot(dates$times, dates$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(dates$times, dates$Sub_metering_2, type = "l", col = "red")
lines(dates$times, dates$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = "solid")
plot(dates$times, dates$Global_reactive_power, type = "l", col = "black", xlab = "datetime", ylab = "Global_reactive_power")

## save plot 4 and close dev
dev.copy(png, "plot4.png", width = 480, height = 480)
dev.off()