# Exploratory Data Analysis Project 2 - Plot 2

# Read the data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Baltimore City, Maryland (fips == "24510")
baltimore.emissions <- NEI[NEI$fips=="24510",]

# Aggregate data by year
aggregatedata <- with(baltimore.emissions, aggregate(Emissions, by = list(year), sum))

# Process plot2 in 480x480 dimensions
png(filename = "plot2.png", width = 480, height = 480, units = "px")

plot(aggregatedata, type = "l", xlab = "Year",
			main = "PM2.5 emission in Baltimore City", 
			ylab = expression('total PM'[2.5]*" emission"))
dev.off()