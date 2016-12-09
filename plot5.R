NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Load ggplot2
library('ggplot2')

## Question 5
## How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

## Subset vehicle data for Baltimore.  
vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]
baltimore <- vehiclesNEI[vehiclesNEI$fips=="24510",]

## Plot data. 
png("plot5.png",width=480,height=480,units="px",bg="transparent")

ggp <- ggplot(baltimore,aes(factor(year),Emissions)) +
  geom_bar(stat="identity",fill="grey",width=0.75) +
  theme_bw() +  guides(fill=FALSE) +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

print(ggp)

dev.off()