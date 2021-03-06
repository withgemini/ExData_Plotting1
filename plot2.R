# Reconstructs plot 2 of the assignment and saves it in plot2.png, using the base plotting system

# Code for reading the data so that the plot can be fully reproduced 
rawData<-read.table('household_power_consumption.txt', header=T, sep=";", nrows=70000, na.strings="?")

dateAndTime <-paste(rawData$Date, rawData$Time)
rawData$datetime<-strptime(dateAndTime, format="%d/%m/%Y %H:%M:%S")

rawData$Date<-as.Date(rawData$Date, format="%d/%m/%Y")

data1<-subset(rawData, Date=='2007-2-1')
data2<-subset(rawData, Date=='2007-2-2')
cleanData<-rbind(data1,data2)



# Code that creates the PNG file with a width of 480 pixels and a height of 480 pixels
png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(cleanData, plot(datetime,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()

 
