
setwd("C:/Users/clorenzini/Desktop/Coursera/Exploratory Data Analysis")

data<-read.delim("household_power_consumption.txt",sep=";",header=T,na.strings="?")

set1<-data[which(data$Date=="1/2/2007"),]
set2<-data[which(data$Date=="2/2/2007"),]

set<-rbind(set1,set2)

x<-set$Global_active_power

tdate <- strptime(paste(set$Date, set$Time), format='%d/%m/%Y %H:%M:%S')

plot(tdate,x,type="l",ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png,file="plot2.png",width = 480, height = 480)

dev.off()