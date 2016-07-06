# Question 1:
# Have total emissions from PM2.5 decreased in the United States from 1999 to
# 2008? Using the base plotting system, make a plot showing the total PM2.5
# emission from all sources for each of the years 1999, 2002, 2005, and 2008.


## Read the input files. 
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

### Emissions Aggregate over the years 
EmissionsYearAgg <- aggregate(Emissions ~ year,NEI, sum)

### Initialize the plot
png("plot1.png")

barplot( (EmissionsYearAgg $Emissions)/10^6,  
  names.arg=EmissionsYearAgg $year,
  xlab="Year",
  ylab="PM2.5 Emissions (10^6 Tons)",
  main="Total PM2.5 Emissions - US"
)

## Close Device 
dev.off()