## Plot 2 ## 

consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption$DateTime <- strptime(paste(consumption$Date, consumption$Time),"%Y-%m-%d %H:%M:%S")
png(filename = "./plot2.png", width = 480, height = 480, units="px")
plot(consumption$DateTime, consumption$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatt)", type = "l")
dev.off()