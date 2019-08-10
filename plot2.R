file <- "household_power_consumption.txt"
powerData <- read.table(file, header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE, dec=".")
powerData <- powerData[powerData$Date %in% c("1/2/2007","2/2/2007") ,]
dateTime <- strptime(paste(powerData$Date, powerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(dateTime, powerData$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()

