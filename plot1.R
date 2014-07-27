# Exploratory Data Analysis Project 2 - Plot 1

# Read the data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Aggregate data by year
aggregatedata <- with(NEI, aggregate(Emissions, by = list(year), sum))

# Process plot1 in 480x480 dimensions
png(filename = "plot1.png", width = 480, height = 480, units = "px")

plot(aggregatedata, type = "l", xlab = "Year",
			main = "Total Emissions in the United States from 1998 - 2008", 
			ylab = expression('total PM'[2.5]*" emission"))
dev.off()