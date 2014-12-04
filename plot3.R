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
#start to plot
par(mfrow=c(1,1))
plot(data$Sub_metering_1,type='l',xaxt= 'n',xlab=' ',ylab="Energy sub metering")
axis(side=1,at=c(0,1440,2880),labels =c("Thu","Fri","Sat"))
lines(data$Sub_metering_2,type='l',col="red")
lines(data$Sub_metering_3,type='l',col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       ,lty=c(1,1,1),lwd=c(2.5,2.5,2.5),
       col=c("black","red","blue"))
dev.copy(png, file="plot3.png",width=480,height=480)
dev.off()