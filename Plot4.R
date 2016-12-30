#Plot 4

#Read file
ElecPowerConsFullData<- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

#Create a subset of data for Fed 1/2007 anf Feb 2, 2007
ElecData<- subset(ElecPowerConsFullData, Date == "1/2/2007" | Date == "2/2/2007")

#Create a new combined DateTime field in correct R format
ElecData$DateTime <- strptime(paste(ElecData$Date, ElecData$Time),format="%d/%m/%Y %H:%M:%S") 

#Open PNG File
png(filename = "Plot4.png", width = 480, height = 480)

# Create Plot 4
par(mfrow = c(2, 2))

plot(ElecData$DateTime, ElecData$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

plot(ElecData$DateTime, ElecData$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(ElecData$DateTime, ElecData$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(ElecData$DateTime, ElecData$Sub_metering_2, type='l', col="red")
lines(ElecData$DateTime, ElecData$Sub_metering_3, type='l', col="blue")
legend("topright",col=c("black", "red", "blue"),legend  =c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ), lwd=2 )

plot(ElecData$DateTime, ElecData$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")


#Close PNG File
dev.off()