# Coursera Exploratory Data Analysis 5/18/14
# Course Project 2 - Plot 2
# Assignment at
# https://class.coursera.org/exdata-002/human_grading/view/courses/972082/assessments/4/submissions
# Data file from
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip
# See download_data.R

# Question 2:
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make a
# plot answering this question.

# Read the data file
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

BaltimoreCity <- subset(NEI, fips == "24510")

# Aggregate using sum the Baltimore emissions data by year
BaltimoreEmissionYr <- aggregate(Emissions ~ year, baltimoreNEI,sum)

png("plot2.png",width=480,height=480,units="px")

barplot(
  BaltimoreEmissionYr$Emissions,
  names.arg=BaltimoreEmissionYr$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From all Baltimore City Sources"
)

dev.off()