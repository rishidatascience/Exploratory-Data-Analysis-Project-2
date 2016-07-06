# Question 2:
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a
# plot answering this question.

# Read the data file
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

## Subset data for Baltimore
BaltimoreCity <- subset(NEI, fips == "24510")


# Aggregate using sum the Baltimore emissions data by year
BaltimoreEmissionYr <- aggregate(Emissions ~ year, BaltimoreCity,sum)

png("plot2.png")

barplot(
  BaltimoreEmissionYr$Emissions,
  names.arg=BaltimoreEmissionYr$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions - Baltimore City"
)

dev.off()