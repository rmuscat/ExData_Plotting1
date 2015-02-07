df <- read.csv("./household_power_consumption.txt",sep=";",stringsAsFactors=FALSE)
red_df <- df[df$Date == '1/2/2007' | df$Date == '2/2/2007', ]
# View(df)
rm(df) # clear some memory up
red_df$Time <- strptime(paste(red_df$Date,red_df$Time),"%d/%m/%Y %H:%M:%S")
red_df$Date <- as.Date(red_df$Date,"%d/%m/%Y")
red_df <- transform(red_df,Global_active_power = as.numeric(Global_active_power))
# View(red_df)

png("plot1.png",width=480,height=480,units="px")
hist(red_df$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="red")
dev.off()