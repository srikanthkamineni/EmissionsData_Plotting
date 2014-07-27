# Exploratory Data Analysis Project 2 - Plot 3

# Load ggplot library
library(ggplot2)

# Read the data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Baltimore City, Maryland (fips == "24510")
baltimore.emissions <- NEI[NEI$fips == "24510", ]

# Aggregate data
aggregatedata <- aggregate(Emissions ~ year + type, data=baltimore.emissions, FUN=sum)

# Process plot3
ggplot(aggregatedata, aes(x=factor(year), y=Emissions, fill=type), dpi = 72) +
  geom_bar(stat="identity") + 
  facet_grid(. ~ type) + 
  ylab(expression('total PM'[2.5]*" emission")) +
  xlab("year") +
  ggtitle("Total Emissions in Baltimore City, Maryland from 1999 - 2008")
ggsave("plot3.png")