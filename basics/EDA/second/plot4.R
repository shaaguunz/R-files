
library(ggplot2)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coals<-SCC$SCC[grep("coal",SCC$EI.Sector,ignore.case = TRUE)]


SC<-subset(NEI,SCC%in% coals)

summ<-aggregate(Emissions~year,SC,sum)

png(filename = "plot4.png", width = 600, height = 600, units = "px", bg = "white")

with(summ, plot(year, Emissions,
                , xlab = "Year", ylab = "Total Emissions", type="l"
                , main="Total Emissions for 
                   coal combustion-related sources"))







dev.off()
