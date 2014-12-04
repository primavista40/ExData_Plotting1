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
#start the plot
par(mfrow=c(1,1))
plot(data$Global_active_power,type='l',xaxt= 'n',xlab=' ',ylab="Global active power (kilowatts)")
axis(side=1,at=c(0,1440,2880),labels =c("Thu","Fri","Sat"))
dev.copy(png, file="plot2.png",width=480,height=480)
dev.off()