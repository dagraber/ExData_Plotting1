#Plot4.R
data <- read.csv("household_power_consumption.txt", sep = ";", colClasses = c("factor", "factor", rep("numeric",7)), na.strings = "?")

library(plyr)
data <- mutate(data, Date = as.Date(Date, format = "%d/%m/%Y"))

thurs <- as.Date("2007-02-01", "%Y-%m-%d")
fri <- as.Date("2007-02-02", "%Y-%m-%d")
data2 <- subset(data, Date == thurs | Date == fri)
data2 <- mutate(data2, Time = strptime(paste(Date,Time), format = "%Y-%m-%d %H:%M:%S"))

#plot4.png
par(mfrow = c(2,2))
with(data2, plot(Time,Global_active_power, type = "l", xlab = "", ylab = "Global Active Power"))
with(data2, plot(Time,Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))
with(data2, plot(Time,Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with(data2, lines(Time, Sub_metering_1, type = "l", col = "black"))
with(data2, lines(Time, Sub_metering_2, type = "l", col = "red"))
with(data2, lines(Time, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty = 1, lwd = 1, col = c("black", "red", "blue"), cex = 0.75, bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
with(data2, plot(Time,Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power"))
dev.copy(png, file = "plot4.png", width = 480, height = 480)
dev.off()