dataFile<- "./EDA/household_power_consumption.txt"
housePower<- read.table(dataFile, header= TRUE, sep=";", na.strings = "?")

##subset the data 
housePower1<- housePower[housePower$Date %in% c("1/2/2007", "2/2/2007"),]
housePower1$Date<- as.Date(housePower1$Date, format="%d/%m/%Y")

## convert date and time format
datetime <- strptime(paste(housePower1$Date, housePower1$Time), "%Y-%M-%d  %H:%M:%S")
globalactive<- as.numeric(housePower1$Global_active_power)
submeter1<- as.numeric(housePower1$Sub_metering_1)
submeter2<- as.numeric(housePower1$Sub_metering_2)
submeter3<- as.numeric(housePower1$Sub_metering_3)
voltage<-as.numeric(housePower1$Voltage)
globalReactive<- as.numeric(housePower1$Global_reactive_power)


##Plot the data 
png(file ="plot4.png", height= 480, width= 480)
par(mfrow=c(2,2))

plot(datetime, globalactive, type="l",xlab="",ylab="Global Active Power")

plot(datetime, voltage, type="l",xlab="datetime",ylab="Voltage")


plot(datetime, submeter1, type="l",xlab="",ylab="Energy Sub metering", col="black")
lines(datetime, submeter2, type="l", col="Red")
lines(datetime, submeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black","red","blue"))

plot(datetime, globalReactive, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()