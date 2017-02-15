#plot2
source('~/source the data.R')

par(mfrow = c(1,1))

data2$DateTime <- paste(data2$Date, data2$Time)
data2$DateTime <- as.POSIXct(data2$DateTime)
plot(data2$Global_active_power~data2$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()