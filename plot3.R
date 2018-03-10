install.packages("readr")
install.packages("dplyr")
install.packages("tidyr")
install.packages("lubridate")
library(readr)
library(dplyr)
library(tidyr)
library(lubridate)

setwd("~/R_WorkDir/Coursera/ExploratoryDataAnalysis/ExData_Plotting1")
filename <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(filename, "elecdata_full")
elecdata <- unzip("elecdata_full")

workingdata <- read_delim(elecdata, delim = ";")
#is.data.frame(workingdata)
workingdata <- workingdata %>% 
  mutate(DateTime = dmy_hms(paste(Date, Time, collapse = NULL)), Date = dmy(Date), Time = hms(Time)) %>% 
  filter(Date >= "2007-02-01" & Date <= "2007-02-02")

png("plot3.png", width = 480, height = 480, bg = "white")
plot(workingdata$DateTime, workingdata$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering", col = "black")
lines(workingdata$DateTime, workingdata$Sub_metering_2, type = "l", ylab = "Energy Sub Metering", col = "red")
lines(workingdata$DateTime, workingdata$Sub_metering_3, type = "l", ylab = "Energy Sub Metering", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2)
dev.off()