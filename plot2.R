#Plot2.R
data <- read.csv("household_power_consumption.txt", sep = ";", colClasses = c("factor", "factor", rep("numeric",7)), na.strings = "?")

library(plyr)
data <- mutate(data, Date = as.Date(Date, format = "%d/%m/%Y"))

thurs <- as.Date("2007-02-01", "%Y-%m-%d")
fri <- as.Date("2007-02-02", "%Y-%m-%d")
data2 <- subset(data, Date == thurs | Date == fri)
data2 <- mutate(data2, Time = strptime(paste(Date,Time), format = "%Y-%m-%d %H:%M:%S"))

#plot2.png
with(data2, plot(Time,Global_active_power, type = "l", ylab = "Global Active Power (kilowatts"))
dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()