
#Data file is renamed as w1EDA.txt and it must be in the current working directory

data <- read.table("w1EDA.txt", header = TRUE, sep = ";")
data1 <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
data1$Global_active_power <- as.numeric(data1$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(data1$Global_active_power, xaxt = "n", main = "Global Active Power" , xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")
dev.off()
