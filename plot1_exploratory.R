# can read the file after unzip or R can be used  to unzip and then read the file
#Here the txt file has been unzipped and put  in the working director
pwc <- read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE, na.strings=c("?"))
# Below we only need data from two days - do note that the Date column can be changed to DATE class and then further processing can be done or the curennt class CHARACTER can be used to choose the dates
pwc <- pwc[pwc$Date == "1/2/2007" | pwc$Date == "2/2/2007", ]


#Alternative reading and filtering
#pwc<-read.table("household_power_consumption.txt",sep=';',header=TRUE,na.strings = "?")
#pwc$Date<-as.Date(pwc$Date,"%d/%m/%Y") - converting to date class
#pwc$Date<-format(pwc$Date,"%d/%m/%Y")- choosing proper date format
#pwc.sub <- pwc[pwc$Date == "1/2/2007" | pwc$Date == "2/2/2007", ]


library(ggplot2)
#png("plot1.png", width = 480, height = 480)

png("plot1.png")
hist(pwc$Global_active_power, 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")
dev.off()
