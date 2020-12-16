Завантаження файлів
```
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
```

1. Чи зменшилися загальні викиди PM2.5 у США з 1999 по 2008 рік?
Використовуючи base plotting system, складіть графік, що показує загальні
(total) викіди PM2.5 з усіх джерел за кожний з 1999, 2002, 2005 та 2008
років.
```
NEI_by_year <- NEI %>% group_by(year) %>% summarise(Total=sum(Emissions))
png("Lab7_plot1.png", width=480, height=480)
barplot((NEI_by_year$Total/10^3), names.arg=NEI_by_year$year, col="red", xlab="Year", ylab="PM2.5 Total Emissions, thousand tons")
dev.off()

```
2. Чи зменшилися загальні викиди PM2.5 у місті Балтімор, штат Меріленд
(fips == "24510") з 1999 по 2008 рік? Скористайтеся base plotting system для
відповіді на це запитання.
```
NEI_Balti <- NEI %>% group_by(year) %>%filter(fips=="24510") %>% summarise(Total=sum(Emissions))
png("Lab7_plot2.png", width=480, height=480)
barplot(NEI_Balti$Total, names.arg=NEI_Balti$year, col="green", xlab="Year", ylab="PM2.5 Total Emissions, tons", 
main="Total PM2.5 Emissions From All Baltimore City Sources")
dev.off()
```
3. З чотирьох типів джерел, позначених змінною type (point, non-point, onroad, or non-road), для якого з цих чотирьох джерел спостерігалось
зменшення викидів у 1999–2008 роках для міста Балтімор? Для яких
спостерігалося збільшення викидів у 1999–2008 роках? Скористайтеся
системою ggplot2, для побудови графіків для відповіді на ці запитання
```
NEI_balti_type <- NEI %>% group_by(year, type) %>%filter(fips=="24510") %>% summarise(Total=sum(Emissions))
png("Lab7_plot3.png", width=480, height=480)
ggplot(NEI_balti_type, aes(factor(year), Total, fill=factor(type))) + 
geom_bar(stat="identity")  +  facet_grid(~type) + guides(fill=FALSE)+ 
labs(x="year", y=expression("Total PM2.5 Emission (Tons)")) + 
labs(title=expression("PM2.5 Emissions in Baltimore City 1999-2008 by Source Type"))
dev.off()
```
4. Як змінилися викиди від джерел спалювання вугілля (coal combustionrelated sources)в США у 1999–2008 роках у США?
```
Coal <- SCC %>% filter(str_detect(EI.Sector, "Coal")) %>% select(SCC)
NEI_coal <- NEI[NEI$SCC %in% Coal$SCC,]
NEI_coal_year <- NEI_coal %>% group_by(year) %>% summarise(Total=sum(Emissions))
png("Lab7_plot4.png", width=480, height=480)
barplot((NEI_coal_year$Total/10^3), names.arg=NEI_coal_year$year, col="black", xlab="Year", ylab="PM2.5 Total Emissions, thousand tons",
main="PM2.5 Coal Combustion-Related Sources in the USA")
dev.off()
```
5. Як змінилися викиди від автомобільних джерел (motor vehicle sources) у
1999–2008 роках у місті Балтимор?
```
Motor <- SCC %>% filter(str_detect(EI.Sector, "Comb")) %>% select(SCC, EI.Sector)
NEI_motor <- NEI[NEI$SCC %in% Motor$SCC,]
NEI_motor_balti <- NEI_motor %>%filter(fips=="24510") %>% group_by(year) %>% summarise(Total=sum(Emissions))
png("Lab7_plot5.png", width=480, height=480)
barplot((NEI_motor_balti$Total), names.arg=NEI_coal_year$year, col="blue", xlab="Year", ylab="PM2.5 Total Emissions, tons", 
main="PM2.5 Motor Vehicle Sources in Baltimore")
dev.off()
```
6. Порівняйте викиди від автомобільних джерел у місті Балтимор із
аналогічними викидами в окрузі Лос-Анджелес, Каліфорнія (fips ==
"06037"). У якому місті відбулися значні зміни з часом у викидах від
автомобільних джерел?
```
 NEI_motor_ba_la <- NEI_motor %>%filter(fips=="24510" | fips=="06037")  %>% 
 mutate(city=case_when(fips=="24510" ~ "Baltimore City", fips=="06037"~ "Los Angeles")) %>% 
 group_by(year, city) %>% summarise(Emissions=sum(Emissions))
png("Lab7_plot6.png", width=480, height=480)
ggplot(NEI_motor_ba_la, aes(factor(year), Emissions, fill=factor(city))) +
geom_bar(stat="identity")  +  facet_grid(~city) + guides(fill=FALSE)+ 
labs(x="year", y=expression("Total PM2.5 Emission (Tons)")) + 
labs(title=expression("Vehicle Source Emissions in Baltimore and LA, 1999-2008"))
dev.off()
```
