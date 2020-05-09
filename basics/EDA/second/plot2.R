NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset data by maryland
maryland<-NEI[NEI$fips=="24510",]

sumt<-aggregate(Emissions~year,maryland,sum)

png(filename = "plot2.png", width = 600, height = 600, units = "px", bg = "white")


with(sumt, plot(year, Emissions,
                  , xlab = "Year", ylab = "Total Emissions", type="l"
                  , main="Total Emissions for each year"))
dev.off()