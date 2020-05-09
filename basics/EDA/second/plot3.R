
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


maryland<-NEI[NEI$fips=="24510",]

summ<-aggregate(Emissions~year+type,maryland,sum)

png(filename = "plot3.png", width = 600, height = 600, units = "px", bg = "white")
ggplot(summ, aes(year, Emissions))+
facet_grid(. ~ type) +
geom_line() +
labs(x="year",y="total pm2.5")




dev.off()
