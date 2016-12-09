## Read in data files provided in project instructions. 
NEI <- readRDS('summarySCC_PM25.rds')
SCC <- readRDS('Source_Classification_Code.rds')

## Question 1
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.

## Sum values from Emissions column by year in the NEI dataset.
AggTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

## Plot using .png file format. 

png('plot1.png')
barplot(height=AggTotalByYear$Emissions, names.arg=AggTotalByYear$year, xlab="Time (Years)", ylab=expression('Total PM'[2.5]*' Emissions'),main=expression('Total PM'[2.5]*' Emissions by Year'))
dev.off()