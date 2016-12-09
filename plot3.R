NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Load ggplot2
library('ggplot2')

## Question 3
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen decreases in emissions from 1999-2008 
## for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the 
## ggplot2 plotting system to make a plot answer this question.

## Subset Baltimore City, Maryland. Aggregate Data by Year and Type. 
SubBalt <- NEI[NEI$fips == "24510", ]

AggTotalByYearAndType <- aggregate(Emissions ~ year + type, SubBalt, sum)

## Create Plot
png("plot3.png", width=640, height=480)
g <- ggplot(AggTotalByYearAndType, aes(year, Emissions, color = type))
g <- g + geom_line() +
  xlab("Years") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()