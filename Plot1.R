## Plot 1 ## 

png(filename = "./plot1.png", width = 480, height = 480, units = "px")
with(consumption, hist(Global_active_power,xlab = "Global Active Power(kilowatts)",col = "red", main = "Global Active Power"))
dev.off()