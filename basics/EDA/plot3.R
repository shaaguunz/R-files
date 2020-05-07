#importing data.table library
library(data.table)

#rather than importing all data at once we can subset the data 
raw<-read.table("household_power_consumption.txt",na.strings="?",sep=";",quote="",skip=66636,nrows=2880)

#printing the head and tail of data
head(raw)
tail(raw)

#adding column names 
colnames(raw)<-c("Date","Time","GlobalActivePower","Voltage",
                 "GlobalIntensity", "SubMetering1", "SubMetering2", "SubMetering3")
raw$DateTime<-strptime(paste(raw$Date,raw$Time),format="%d/%m/%Y %H:%M:%S")


#now make first plot
png(filename="plot3.png",width=480,height=480,units="px")
plot(x = raw$DateTime, y = raw$SubMetering1, type = 'l',xlab=NA,ylab="Energy sub metering")

lines(x=raw$DateTime,y=raw$SubMetering2,col="red")
lines(x=raw$DateTime,y=raw$SubMetering3,col="blue")

legend('topright', 
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'),
       lwd = 1)
dev.off()