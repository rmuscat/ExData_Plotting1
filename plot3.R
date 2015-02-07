df <- read.csv("./household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
red_df <- df[df$Date == '1/2/2007' | df$Date == '2/2/2007', ]
# View(df)
rm(df) # clear some memory up
red_df$Time <- strptime(paste(red_df$Date,red_df$Time),"%d/%m/%Y %H:%M:%S")
red_df$Date <- as.Date(red_df$Date,"%d/%m/%Y")
red_df <- transform(red_df,Sub_metering_1 = as.numeric(Sub_metering_1),Sub_metering_2 = as.numeric(Sub_metering_2),Sub_metering_3 = as.numeric(Sub_metering_3))
# View(red_df)

png("plot3.png",width=480,height=480,units="px")
plot(red_df$Time,red_df$Sub_metering_1,type="l",col="Black",xlab="",ylab="Energy sub metering",ylim=c(0,max(red_df$Sub_metering_1,red_df$Sub_metering_2,red_df$Sub_metering_3)))
lines(red_df$Time,red_df$Sub_metering_2,col="red",type="l")
lines(red_df$Time,red_df$Sub_metering_3,col="blue",type="l")
legend("topright",col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1))
dev.off()