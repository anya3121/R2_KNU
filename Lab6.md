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
1. Гісторгама Global Active Power
```
hist(sub_data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
```

