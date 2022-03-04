dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global_ActivePow <- as.numeric(subSetData$Global_active_power)
global_ReactivePow <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMet1 <- as.numeric(subSetData$Sub_metering_1)
subMet2 <- as.numeric(subSetData$Sub_metering_2)
subMet3 <- as.numeric(subSetData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, global_ActivePow, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMet1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMet2, type="l", col="red")
lines(datetime, subMet3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, global_ReactivePow, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

