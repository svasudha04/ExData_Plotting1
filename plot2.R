## read the dataset 
dataFile<- "./EDA/household_power_consumption.txt"
housePower<- read.table(dataFile, header= TRUE, sep=";", na.strings = "?")

##subset the data 
housePower1<- housePower[housePower$Date %in% c("1/2/2007", "2/2/2007"),]
housePower1$Date<- as.Date(housePower1$Date, format="%d/%m/%Y")

## convert date and time format
datetime <- strptime(paste(housePower1$Date, housePower1$Time), "%Y-%M-%d  %H:%M:%S")
globalactive<- as.numeric(housePower1$Global_active_power)
##Plot the data 
png(file ="plot2.png", height= 480, width= 480)
plot(datetime, globalactive, type="l",xlab="",ylab="Global Active Power(kilowatts)")

dev.off()