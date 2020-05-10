## Flávia ###
## 2020-05-10 20:21:40 -03 ##
## Exploring Data Analysis ##
## Course Project 1 ##

### Plot 2 ###

# clean environment
rm(list = ls())

# Read the file downloaded for plot 1 into R
household <- read.table("household_power_consumption.txt", sep = ";",
                        header = T, stringsAsFactors = F, na.strings = "?")

# Convert date and time to proper classes in R

# Put together date and time
household$Date_and_Time <- paste(household$Date, household$Time)

# Convert it
household$Date_and_Time <- strptime(household$Date_and_Time , 
                                    format = "%d/%m/%Y %H:%M:%S")

# Get subset of the data that will be used to make this plot
# The subset needed are the days 2007-02-01 and 2007-02-02
household_used <- subset(household, format(Date_and_Time,'%d-%m-%Y') 
                         %in% c('01-02-2007', '02-02-2007'))

# Make the plot
png("plot2.png", width = 480)
with(household_used, plot(Date_and_Time, Global_active_power, type = "n",
                          xlab = "",
                          ylab = "Global Active Power (kilowatts)"))
with(household_used, lines(Date_and_Time, Global_active_power))
dev.off()
