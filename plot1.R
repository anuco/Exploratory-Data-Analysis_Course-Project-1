## loading data from the file
datafile <- "household_power_consumption.txt"
data <- read.table(datafile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
## loading data for the two days 
twodaysdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

## converting active power data into numeric vector for plotting
globalactivepower <- as.numeric(twodaysdata$Global_active_power)

## generating the output 
png("plot1.png", width=480, height=480)
hist(globalactivepower, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()