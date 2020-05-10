## Flávia ###
## 2020-05-10 18:04:37 -03 ##
## Exploring Data Analysis ##
## Course Project 1 ##

### Plot 1 ###

# clean environment
rm(list = ls())

# First of all, download the file
con <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(con, destfile = "household_power_consumption.zip", method = "curl")
unzip("household_power_consumption.zip")

# Then, read it into R
household <- read.table("household_power_consumption.txt", sep = ";",
                        header = T, stringsAsFactors = F, na.strings = "?")

# Convert date and time to proper classes in R

# Put together date and time
household$Date_and_Time <- paste(household$Date, household$Time)
household$Date_and_Time <- strptime(household$Date_and_Time , 
                                    format = "%d/%m/%Y %H:%M:%S")

# Get subset of the data that will be used to make this plot
# The subset needed are the days 2007-02-01 and 2007-02-02
household_used <- subset(household, format(Date_and_Time,'%d-%m-%Y') 
                %in% c('01-02-2007', '02-02-2007'))

# Make the plot
png("plot1.png", width = 480)
par(cex = 0.8)
hist(household_used$Global_active_power, ylim = c(0,1200),
     col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
