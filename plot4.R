# Reconstructs plot 4 of the assignment and saves it in plot4.png, using the base plotting system

# Code for reading the data so that the plot can be fully reproduced 
rawData<-read.table('household_power_consumption.txt', header=T, sep=";", nrows=70000, na.strings="?")

dateAndTime <-paste(rawData$Date, rawData$Time)
rawData$datetime<-strptime(dateAndTime, format="%d/%m/%Y %H:%M:%S")

rawData$Date<-as.Date(rawData$Date, format="%d/%m/%Y")

data1<-subset(rawData, Date=='2007-2-1')
data2<-subset(rawData, Date=='2007-2-2')
cleanData<-rbind(data1,data2)



# Code that creates the PNG file with a width of 480 pixels and a height of 480 pixels
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))
with(cleanData, plot(datetime,Global_active_power, type="l", ylab="Global Active Power", xlab=""))
with(cleanData, plot(datetime,Voltage, type="l", ylab="Voltage"))

with(cleanData, plot(datetime,Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab=""))
with(cleanData, lines(datetime,Sub_metering_2, type="l", col="red"))
with(cleanData, lines(datetime,Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(cleanData, plot(datetime,Global_reactive_power, type="l"))
dev.off()

 
