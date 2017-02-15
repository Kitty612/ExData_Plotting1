#plot3
source('~/source the data.R')

par(mfrow = c(1,1))

data2$DateTime <- paste(data2$Date, data2$Time)
data2$DateTime <- as.POSIXct(data2$DateTime)

with(data2, {
  plot(Sub_metering_1~DateTime, type = "l", ylab = "Energy sub metering", xlab = "") 
  lines(Sub_metering_2~DateTime, col = 'Red')
  lines(Sub_metering_3~DateTime, col = 'Blue')
})
legend("topright", lwd = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
