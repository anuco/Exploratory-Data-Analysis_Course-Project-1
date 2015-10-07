## loading data from the file
datafile <- "household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## loading data for the two days 
twodaysdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## converting all data into numeric vector for plotting
energysubmetering1 <- as.numeric(twodaysdata$Sub_metering_1)
energysubmetering2 <- as.numeric(twodaysdata$Sub_metering_2)
energysubmetering3 <- as.numeric(twodaysdata$Sub_metering_3)
globalactivepower <- as.numeric(twodaysdata$Global_active_power)
globalreactivepower <- as.numeric(twodaysdata$Global_reactive_power)
voltage<- as.numeric(twodaysdata$Voltage)

## converting date and time data into the required format
dateandtime <- strptime(paste(twodaysdata$Date, twodaysdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## generating the output 
png("plot4.png", width=480, height=480)

## formatting for four charts
par(mfrow = c(2, 2))

## charts functions
plot(dateandtime, globalactivepower, type = "l", xlab = "", ylab = "Global Active Power")
plot(dateandtime, voltage, type = "l", xlab = "datetime", ylab = "Voltage" )
plot(dateandtime, energysubmetering1, type = "l", xlab = "", ylab="Energy Submetering")
lines(dateandtime, energysubmetering2, type = "l", col = "red")
lines(dateandtime, energysubmetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col = c("black", "red", "blue"))
plot(dateandtime, globalreactivepower, type = "l", xlab = "datetime", ylab = "Global Reactive Power")
dev.off()