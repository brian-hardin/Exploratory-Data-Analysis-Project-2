## Read in data files provided in project instructions. 
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

## Question 2
## Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == '24510') from 1999 to 2008?
## Use the base plotting system to make a plot answering this question.

## Subset Baltimore City, MD and sum values from Emissions column by year in the NEI dataset.
SubBalt  <- NEI[NEI$fips=="24510", ]

AggTotalByYear <- aggregate(Emissions ~ year, subsetNEI, sum)

## Plot using .png file format. 
png('plot2.png')
barplot(height=AggTotalByYear$Emissions, names.arg=AggTotalByYear$year, xlab="Time (Years)", ylab=expression('Total PM'[2.5]*' Emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions by Year'))
dev.off()
