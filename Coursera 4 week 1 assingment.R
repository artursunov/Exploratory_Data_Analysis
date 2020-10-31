
## Downloading data ## 

if(!file.exists("~/newests/Coursera/household_power_consumption.zip")){
  fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl, destfile = "~/newests/Coursera/household_power_consumption.zip")
}

unzip(zipfile = "~/newests/Coursera/household_power_consumption.zip",exdir = "./data")


## Opening data ## 

data <- file("~/newests/Coursera/household_power_consumption.txt")

consumption <- read.table(text = grep("^[1,2]/2/2007", readLines(data),value=TRUE), sep = ";", col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), na.strings = "?")
head(consumption)

### Plotting ### 

## Plot 1 ## 

png(filename = "./plot1.png", width = 480, height = 480, units = "px")
with(consumption, hist(Global_active_power,xlab = "Global Active Power(kilowatts)",col = "red", main = "Global Active Power"))
dev.off()

## Plot 2 ## 

consumption$Date <- as.Date(consumption$Date, format = "%d/%m/%Y")
consumption$DateTime <- strptime(paste(consumption$Date, consumption$Time),"%Y-%m-%d %H:%M:%S")
png(filename = "./plot2.png", width = 480, height = 480, units="px")
plot(consumption$DateTime, consumption$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatt)", type = "l")
dev.off()

## Plot 3 ##

png(filename = "./plot3.png", width = 480, height = 480, units="px")
plot(consumption$DateTime, consumption$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(consumption$DateTime, consumption$Sub_metering_2, col = "red")
lines(consumption$DateTime, consumption$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
dev.off()


## Plot 4 ## 

png(filename = "./plot4.png", width = 480, height = 480, units="px")
par(mfrow = c(2, 2))
plot(consumption$DateTime, consumption$Global_active_power, xlab = "", ylab = "Global Active Power (kilowatt)", type = "l")
plot(consumption$DateTime, consumption$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(consumption$DateTime, consumption$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "l")
lines(consumption$DateTime, consumption$Sub_metering_2, col = "red")
lines(consumption$DateTime, consumption$Sub_metering_3, col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
plot(consumption$DateTime, consumption$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.off()