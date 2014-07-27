# Exploratory Data Analysis Project 2 - Plot 6

library(ggplot2)

# Read the data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Baltimore emissions from motor vehicle sources
bmore.emissions <- NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
bmore.emissions.aggr <- aggregate(Emissions ~ year, data=bmore.emissions, FUN=sum)

# Los Angeles emissions from motor vehicle sources
la.emissions <- NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]
la.emissions.aggr <- aggregate(Emissions ~ year, data=la.emissions, FUN=sum)

bmore.emissions.aggr$County <- "Baltimore City, MD"
la.emissions.aggr$County <- "Los Angeles County, CA"
both.emissions <- rbind(bmore.emissions.aggr, la.emissions.aggr)

# Process plot6
ggplot(both.emissions, aes(x=factor(year), y=Emissions, fill=County), dpi=72) +
    geom_bar(stat="identity") + 
    facet_grid(County  ~ ., scales="free") +
    ylab (expression('total PM'[2.5]*" emission")) + 
    xlab("year") +
    ggtitle(expression("Comparison of Motor vehicle emissions\nin Baltimore and Los Angeles from 1999 - 2008"))
ggsave("plot6.png")