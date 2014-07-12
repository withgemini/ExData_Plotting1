# Reconstructs plot 3 of the assignment and saves it in plot3.png, using the base plotting system

# Code for reading the data so that the plot can be fully reproduced 
rawData<-read.table('household_power_consumption.txt', header=T, sep=";", nrows=70000, na.strings="?")

dateAndTime <-paste(rawData$Date, rawData$Time)
rawData$datetime<-strptime(dateAndTime, format="%d/%m/%Y %H:%M:%S")

rawData$Date<-as.Date(rawData$Date, format="%d/%m/%Y")

data1<-subset(rawData, Date=='2007-2-1')
data2<-subset(rawData, Date=='2007-2-2')
cleanData<-rbind(data1,data2)



# Code that creates the PNG file with a width of 480 pixels and a height of 480 pixels
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(cleanData, plot(datetime,Sub_metering_1, type="l", ylab="Energy Sub Metering", xlab=""))
with(cleanData, lines(datetime,Sub_metering_2, type="l", col="red"))
with(cleanData, lines(datetime,Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

 
