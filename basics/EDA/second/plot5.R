
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

maryland<-NEI[NEI$fips=="24510",]

#for motor vehicels source

road<-subset(SCC,Data.Category=="Onroad")
motor<-road$SCC



SC<-subset(maryland,SCC%in% motor)

summ<-aggregate(Emissions~year,SC,sum)

png(filename = "plot5.png", width = 600, height = 600, units = "px", bg = "white")

with(summ, plot(year, Emissions,
                , xlab = "Year", ylab = "Total Emissions", type="l"
                , main="Total Emissions for 
                   motor vehicle sources"))







dev.off()
