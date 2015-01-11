## Getting the complete  dataset
setwd("c:/Users/victor/Downloads/")
datos <- read.csv("./exdata_data_household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
datos$Date <- as.Date(datos$Date, format="%d/%m/%Y")

## Subsetting the data in two days
data <- subset(datos, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(datos)

## We proceed to convert dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#We create Plot 2
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()



