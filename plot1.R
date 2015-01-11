## Getting the power consumption data
setwd("c:/Users/victor/Downloads/")
datos <- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
datos$Date <- as.Date(datos$Date, format="%d/%m/%Y")

## Subsetting the data for only two days
data <- subset(datos, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(datos)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Creating Plot 1

png(filename = "plot1.png",
width = 480, height = 480,
units = "px", bg = "transparent")
hist(data$Global_active_power,
col = "red",
main = "Global Active Power",
xlab = "Global Active Power (kilowatts)",
breaks = 12, ylim = c(0, 1200))
dev.off()


#hist(data$Global_active_power, main="Global Active Power", 
#     xlab="Global Active Power (Kilowatts)", ylab="Frequency", col="Red")

## Saving to file
#dev.copy(png, file="plot1.png", height=480, width=480)
#dev.off()