file <- "household_power_consumption.txt"
powerData <- read.table(file, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE, dec=".")
powerData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]
dateTime <- strptime(paste(powerData$Date, powerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(dateTime, powerData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(dateTime, powerData$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(dateTime, powerData$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering", col = "black")
lines(dateTime, powerData$Sub_metering_2, type="l", col = "red")
lines(dateTime, powerData$Sub_metering_3, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, 
       col = c("black", "red", "blue"))
plot(dateTime, powerData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()
