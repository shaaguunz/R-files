
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

LA<-NEI[with(NEI,fips=="06037"|fips=="24510"),]

#for motor vehicels source

road<-subset(SCC,Data.Category=="Onroad")
motor<-road$SCC



SC<-subset(LA,SCC%in% motor)

summ<-aggregate(Emissions~year+fips,SC,sum)

png(filename = "plot6.png", width = 600, height = 600, units = "px", bg = "white")

ggplot(summ, aes(year, Emissions))+
    facet_grid(. ~ fips) +
    geom_line() +
    labs(x="year",y="total pm2.5")








dev.off()
