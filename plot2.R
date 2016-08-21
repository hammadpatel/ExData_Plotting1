#Data file is renamed as w1EDA.txt and it must be in the current working directory


data <- read.table("w1EDA.txt", header = TRUE, sep = ";")
data1 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")

data1$DateTime <- as.character(paste(data1$Date, data1$Time, sep = " "))
data1$DateTime <- strptime(data1$DateTime, format='%d/%m/%Y %H:%M:%S')
data1$Global_active_power <- as.numeric(data1$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(data1$DateTime,data1$Global_active_power, type="l" , ylab="Global Active Power (kilowatts)")
dev.off()
