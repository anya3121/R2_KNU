1. За допомогою download.file() завантажте любий excel файл з порталу
http://data.gov.ua та зчитайте його (xls, xlsx – бінарні формати, тому
встановить mode = “wb”. Виведіть перші 6 строк отриманого фрейму
даних.
```
url<-"https://data.gov.ua/dataset/2cde453d-a726-40e8-95f5-03eb05d4bfcc/resource/2e477324-76a3-4802-8e80-0ec2dc196a03/download/info_aes_blocks_15_10_2020.xlsx"
download.file(url,destfile="./datagov.xlsx", mode='wb')
df<-read_excel("datagov.xlsx")
head(df,6)
```
```
# A tibble: 6 x 7
  station unit_number installed_capacity reactor_type fuel  сommercial_operation_date `lifetime_ extension`
  <chr>         <dbl>              <dbl> <chr>        <chr> <dttm>                    <dttm>               
1 ЗАЕС              1               1000 ВВЕР-1000    ТВ    1985-12-25 00:00:00       2016-09-19 00:00:00  
2 ЗАЕС              2               1000 ВВЕР-1000    Т     1986-02-15 00:00:00       2016-10-06 00:00:00  
3 ЗАЕС              3               1000 ВВЕР-1000    ТВ    1987-03-05 00:00:00       2017-11-07 00:00:00  
4 ЗАЕС              4               1000 ВВЕР-1000    ТВ    1988-04-14 00:00:00       2018-10-11 00:00:00  
5 ЗАЕС              5               1000 ВВЕР-1000    В     1989-10-27 00:00:00       NA                   
6 ЗАЕС              6               1000 ВВЕР-1000    Т     1996-10-17 00:00:00       NA                   
```
2. За допомогою download.file() завантажте файл getdata_data_ss06hid.csv за
посиланням https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv та
завантажте дані в R. Code book, що пояснює значення змінних
знаходиться за посиланням https://www.dropbox.com/s/dijv0rlwo4mryv5/PUMSDataDict06.pdf?dl=0
Необхідно знайти, скільки property мають value $1000000+
```
url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(url,destfile = './getdata_data_ss06hid.csv')
df<-read.csv('getdata_data_ss06hid.csv') 
df24<-subset(df, VAL==24) # Proparty value = VAL, $1000000+ = 24
nrow(df24)
```
```
[1] 53
```
3.Зчитайте xml файл за посиланням
http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml
Скільки ресторанів мають zipcode 21231?
```
library(XML)
url<-'http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
hml_data<-xmlTreeParse(url, useInternal=TRUE)
root<-xmlRoot(hml_data)
df<-xpathSApply(root,"//zipcode",xmlValue)
length(which(df==21231))
```
```
[1] 127
```
