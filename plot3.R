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

##Plot the data 
png(file ="plot3.png", height= 480, width= 480)
plot(datetime, submeter1, type="l",xlab="",ylab="Energy Submetering", col="black")
lines(datetime, submeter2, type="l", col="Red")
lines(datetime, submeter3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black","red","blue"))

dev.off()