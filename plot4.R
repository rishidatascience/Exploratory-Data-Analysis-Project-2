
library(ggplot2)
# Load the NEI & SCC data frames.
NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

### Subset combustion related data
combustionRelated <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
## Subset Coal related data 
coalRelated <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
## Get data which has combustion and coal
coalCombustion <- (combustionRelated & coalRelated)

combustionSCC <- SCC[coalCombustion,]$SCC
combustioninNEI <- NEI[NEI$SCC %in% combustionSCC,]

png("plot4.png")

plot4 <- ggplot(combustioninNEI,aes(factor(year),Emissions/10^5)) +
  geom_bar(stat="identity",width=0.50, col="blue") +
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (10^5 Tons)")) + 
  labs(title=expression("PM"[2.5]*" Coal & Combustion Emissions - 1999-2008"))

print(plot4)

dev.off()