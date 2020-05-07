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
raw$DateTime<-strptime(paste(raw$Datem,raw$Time),format="%d/%m/%y %H:%M:%S")


#now make first plot
png(filename="plot1.png",width=480,height=480,units="px")
hist(raw$GlobalActivePower,col="red",main = "Global Active Power",xlab = "Global Active Power (killowatts")
dev.off()