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
with(data,hist(Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",
               ylab="Frequency",ylim=c(0,1200)))
#make png file
dev.copy(png, file="plot1.png",width=480,height=480)
dev.off()