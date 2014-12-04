#calling the package data.table in order to use fread
library(data.table)
#read the data using fread
HP2<-fread("household_power_consumption.txt", na.strings = c("?",""))
#choose each of the date
data1<-HP2[Date == "1/2/2007"]
data2<-HP2[Date == "2/2/2007"]
#bind the data together
data<-rbind(data1,data2)
#change the class of the data into numeric
data$Global_active_power<-as.numeric(data$Global_active_power)
data$Sub_metering_1<-as.numeric(data$Sub_metering_1)
data$Sub_metering_2<-as.numeric(data$Sub_metering_2)
data$Sub_metering_3<-as.numeric(data$Sub_metering_3)
data$Global_reactive_power<-as.numeric(data$Global_reactive_power)
data$Voltage<-as.numeric(data$Voltage)
#start plotting
par(mfrow=c(2,2),cex.axis=1,cex.lab=1.2)
#top left
plot(data$Global_active_power,type='l',xaxt= 'n',xlab=' '
     ,ylab="Global active power")
axis(side=1,at=c(0,1440,2880),labels =c("Thu","Fri","Sat"),cex.axis=1)
#top right
plot(data$Voltage,type='l',xaxt= 'n',ylab="Voltage",xlab="datetime")
axis(side=1,at=c(0,1440,2880),labels =c("Thu","Fri","Sat"),cex.axis=1)
#bottom left
plot(data$Sub_metering_1,type='l',xaxt= 'n',xlab=' '
     ,ylab="Energy sub metering"     )
#creating legend
axis(side=1,at=c(0,1440,2880),labels =c("Thu","Fri","Sat"))
lines(data$Sub_metering_2,type='l',col="red")
lines(data$Sub_metering_3,type='l',col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       ,lty=c(1,1,1),lwd=c(2.5,2.5,2.5),
       col=c("black","red","blue"),bty="n",cex=0.5,
       y.intersp=0.5,xjust=0,yjust=0)
#bottom right
plot(data$Global_reactive_power,xlab='datetime',ylab='Global_reactive_power',type='l')
dev.copy(png, file="plot4.png",width=480,height=480)
dev.off()
