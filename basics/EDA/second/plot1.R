library(dplyr)


NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#using sum of Emmisions
sumdat<-aggregate(Emissions~year,NEI,sum)


png(filename = "plot1.png", width = 600, height = 600, units = "px", bg = "white")
#plotting
with(sumdat, plot(year, Emissions,
                   , xlab = "Year", ylab = "Total Emissions", type="l"
                   , main="Total Emissions for each year"))

dev.off() ## Close the PNG device!