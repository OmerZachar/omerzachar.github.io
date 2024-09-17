temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data_full <- read.table(unz(temp,"household_power_consumption.txt"), 
                        sep=";", 
                        header = T, 
                        na="?", 
                        colClasses = c("character",
                                       'character',
                                       'numeric',
                                       'numeric',
                                       'numeric',
                                       'numeric',
                                       'numeric',
                                       'numeric',
                                       'numeric'))

sub_data <- subset(data_full, Date %in% c("1/2/2007","2/2/2007"))

png("plot1.png", width=480, height=480)

hist(sub_data$Global_active_power, main = NULL, xlab = "", col = "red")
title(main = "Global Active Power", xlab = "Gloval Active Power (kilowatts)")

dev.off()
