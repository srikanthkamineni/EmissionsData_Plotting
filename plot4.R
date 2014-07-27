# Exploratory Data Analysis Project 2 - Plot 4

# Read the data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Identify coal combustion-related sources
coal.combustion <- grep("coal", SCC$Short.Name, ignore.case = T)
coal.combustion <- SCC[coal.combustion, ]

# Find emissions from coal combustion-related sources
coal.combustion <- NEI[NEI$SCC %in% coal.combustion$SCC, ]

# Aggregate by year
Emissions.year <- aggregate(coal.combustion$Emissions, list(coal.combustion$year), sum)

# Process plot4 in 480x480 dimensions
png(filename = "plot4.png", width = 480, height = 480, units = "px")

plot(Emissions.year, type = "l", xlab = "Year",
			main = "Total Emissions From Coal Combustion-related
				  sources changed from 1999-2008",
			ylab = expression('total PM'[2.5]*" emission"))
dev.off()
