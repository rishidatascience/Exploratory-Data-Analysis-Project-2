library(ggplot2)

# Load the NEI & SCC data frames.
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles,]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC,]

# Subset the vehicles NEI data by each city's fip and add city name.
vehBaltimoreNEI <- vehiclesNEI[vehiclesNEI$fips=="24510",]
vehBaltimoreNEI$city <- "Baltimore City"

vehLANEI <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehLANEI$city <- "Los Angeles"

# Combine the two subsets with city name into one data frame
combinedNEI <- rbind(vehBaltimoreNEI,vehLANEI)

png("plot6.png",width=480,height=480,units="px",bg="transparent")


 
plot6 <- ggplot(combinedNEI, aes(x=factor(year), y=Emissions, fill=city)) +
 geom_bar(aes(fill=year),stat="identity") +
 facet_grid(.~city) +
 labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
 labs(title=expression("PM"[2.5]*" Motor Vehicle Emissions - Baltimore & LA, 1999-2008"))
 
print(plot6)

dev.off()