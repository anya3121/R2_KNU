Завантаження даних:
```
URL <- "https://archive.ics.uci.edu/ml/machine-learning-databases/00235/household_power_consumption.zip"
download.file(URL, destfile = paste0(getwd(), '/household_power_consumption.zip'), method = "curl")
no_zip<- unzip("household_power_consumption.zip",exdir = "data")
data <- read.table( "data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
sub_data <- subset(data,Date=="1/2/2007"|Date=="2/2/2007")
sub_data$Date<-as.Date(sub_data$Date, format = "%d/%m/%Y")
sub_data$DateTime<-strptime(paste(sub_data$Date,sub_data$Time),"%F %T")
```
1. Global Active Power frequency
```
hist(sub_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
```

![Plot]
(https://github.com/anya3121/R2_KNU/blob/main/plot1.png)

2. Global Active Power by days of the week
```
plot(sub_data$DateTime,sub_data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
```
3. Energy sub matering
```
plot(sub_data$DateTime,sub_data$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(sub_data$DateTime,sub_data$Sub_metering_2, col="red", type="l")
points(sub_data$DateTime,sub_data$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(sub_data[,7:9]))
```
4.Combination of 4 plots
```
par(mfcol=c(2,2))
# Plot 4.1
plot(sub_data$DateTime, sub_data$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", pch =".", type="l")
# Plot 4.2
plot(sub_data$DateTime, sub_data$Sub_metering_1,ylab="Energy sub metering", xlab="", type="l", col="black")
points(sub_data$DateTime, sub_data$Sub_metering_2, col="red", type="l")
points(sub_data$DateTime, sub_data$Sub_metering_3, col="blue", type="l")
legend("topright", lwd=1, col=c("black", "red", "blue"), legend=names(sub_data[,7:9]), bty="n")
# Plot 4.3
plot(sub_data$DateTime, sub_data$Voltage, ylab="Voltage", xlab="datetime", type="l")
# Plot 4.4
plot(sub_data$DateTime, sub_data$Global_reactive_power, ylab="Global_reactive_power", xlab="datetime", type="l")
```


