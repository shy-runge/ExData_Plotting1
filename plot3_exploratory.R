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


pwc$DateTime2 = paste(pwc$Date, pwc$Time) # Joining date and time in new column
pwc$DateTime2 = as.POSIXlt(pwc$DateTime2,format="%d/%m/%Y %H:%M:%S")  #formatting of date time

png("plot3.png")
plot(x=(pwc$DateTime),y=pwc$Sub_metering_1,type="l",ylab="Energy sub metering",xlab="") #plotting submeter 1 first
lines(x=(pwc$DateTime),y=pwc$Sub_metering_2,col="red") # adding submeter 2
lines(x=(pwc$DateTime),y=pwc$Sub_metering_3,col="blue")# adding submeter 3

legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),bty="l",col=c("black","red","blue"),lwd=2,cex=0.7) # adding legend
dev.off()