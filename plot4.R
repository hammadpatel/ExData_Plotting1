#Data file is renamed as w1EDA.txt and it must be in the current working directory
data <- read.table("w1EDA.txt", header = TRUE, sep = ";")
data1 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data1$DateTime <- as.character(paste(data1$Date, data1$Time, sep = " "))
data1$DateTime <- strptime(data1$DateTime, format='%d/%m/%Y %H:%M:%S')
data1$Global_active_power <- as.numeric(data1$Global_active_power)
data1$Voltage <- as.numeric(data1$Voltage)
data1$Global_reactive_power <- as.numeric(data1$Global_reactive_power)

png("plot4.png")

par(mfrow=c(2,2) , mar = c(2,2,2,2), oma = c(1,4,1,1))

plot(data1$DateTime,data1$Global_active_power, type="l" , ylab="Global Active Power (kilowatts)")

plot(data1$DateTime,data1$Voltage, type="l" , ylab="Voltage", xlab = "datetime")

plot(data1$DateTime,data1$Sub_metering_1, type="l" , ylab="Energy sub metering", xaxt = 'n')
axis(side = 2, at = seq(0,30, by = 10))
lines(data1$DateTime, data1$Sub_metering_3, col = "blue")
lines(data1$DateTime, data1$Sub_metering_2, col = "red")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)

plot(data1$DateTime,data1$Global_reactive_power, type="l" , ylab="Voltage", xlab = "datetime")

dev.off()

