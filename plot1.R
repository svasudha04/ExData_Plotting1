## read the dataset 
dataFile<- "./EDA/household_power_consumption.txt"
housePower<- read.table(dataFile, header= TRUE, sep=";", na.strings = "?")

##subset the data 
housePower1<- subset(housePower, Date %in% c("1/2/2007", "2/2/2007"))
housePower1$Date<- as.Date(housePower1$Date, format="%d/%m/%Y")

##Plot the data 
hist(housePower1$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)",ylab="Frequency", col="Red")
dev.copy(png, file ="plot1.png", height= 480, width= 480)
dev.off()