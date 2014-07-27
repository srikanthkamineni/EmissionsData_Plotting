# Exploratory Data Analysis Project 2 - Plot 5

# Read the data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Baltimore City, Maryland (fips == "24510")
baltimore.emissions <- NEI[NEI$fips == "24510", ]

# Identify motor combustion-related sources
motor.combustion <- grep("motor", SCC$Short.Name, ignore.case = T)
motor.combustion <- SCC[motor.combustion, ]

# Find emissions from motor combustion-related sources
motor.combustion <- baltimore.emissions[baltimore.emissions$SCC %in% motor.combustion$SCC, ]

# Aggregate by year
Emissions.year <- aggregate(motor.combustion$Emissions, list(motor.combustion$year), sum)

# Process plot5 in 480x480 dimensions
png(filename = "plot5.png", width = 480, height = 480, units = "px")

plot(Emissions.year, type = "l", xlab = "Year",
			main = "Total Emissions From Motor Vehicle Sources 
			  	  Changed From 1999-2008 in Baltimore City",
			ylab = expression('total PM'[2.5]*" emission"))
dev.off()
