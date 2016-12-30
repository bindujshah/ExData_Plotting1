#Plot 1

#Read file
ElecPowerConsFullData<- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

#Create a subset of data for Fed 1/2007 anf Feb 2, 2007
ElecData<- subset(ElecPowerConsFullData, Date == "1/2/2007" | Date == "2/2/2007")

#Create a new combined DateTime field in correct R format
ElecData$DateTime <- strptime(paste(ElecData$Date, ElecData$Time),format="%d/%m/%Y %H:%M:%S") 

#Open PNG File
png(filename = "Plot1.png", width = 480, height = 480)
# Create Plot 1
hist(ElecData$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
#Close PNG File
dev.off()