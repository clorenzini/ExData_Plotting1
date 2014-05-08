
setwd("C:/Users/clorenzini/Desktop/Coursera/Exploratory Data Analysis")

data<-read.delim("household_power_consumption.txt",sep=";",header=T,na.strings="?")

set1<-data[which(data$Date=="1/2/2007"),]
set2<-data[which(data$Date=="2/2/2007"),]

set<-rbind(set1,set2)

x1<-set$Sub_metering_1
x2<-set$Sub_metering_2
x3<-set$Sub_metering_3

tdate <- strptime(paste(set$Date, set$Time), format='%d/%m/%Y %H:%M:%S')

plot(tdate,x1,type="l",xlab="",ylab="Energy sub metering")
lines(tdate,x2,type="l",col="red")
lines(tdate,x3,type="l",col="blue")
legend("topright",y=30,lty=1,cex=0.7,pt.cex=0.7,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),y.intersp=0.5)

dev.copy(png,file="plot3.png",width = 480, height = 480)

dev.off()