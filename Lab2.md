
2.Встановить в R пакет для роботи з HDF5 файлами
```
install.packages("BiocManager")
BiocManager::install("rhdf5")
library ("rhdf5")
``` 
3. Виведіть зміст файлу командою h5ls()
```
h5ls("C:/Users/Admin/Desktop/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5")
```
4. Зчитайте результати вимірів. Для цього зчитайте name Strain з групи strain
в змінну strain.
```
strain <- h5read("C:/Users/Admin/Desktop/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5", "strain/Strain")
```
5. Також з «strain/Strain» зчитайте атрибут (функція h5readAttributes)
Xspacing в змінну st та виведіть її. Це інтервал часу між вимірами.
```
> st <- h5readAttributes(file="C:/Users/Admin/Desktop/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5", name="strain/Strain")$Xspacing
> st
```
```
[1] 0.0002441406
```
6.Знайдіть час початку події та її тривалість. Для цього з групи meta зчитайте
в змінну gpsStart name GPSstart та в змінну duration name Duration
```
> gpsStart <- h5read("C:/Users/Admin/Desktop/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5","meta/GPSstart")
> gpsStart
```
```
[1] 1187006834
```
```
> duration<-h5read("C:/Users/Admin/Desktop/H-H1_LOSC_C00_4_V1-1187006834-4096.hdf5","meta/Duration")
> duration
[1] 4096
````
7. Знайдіть час закінчення події та збережіть його в змінну gpsEnd.
```
>  gpsEnd <- gpsStart+duration
> gpsEnd
```
```
[1] 1187010930
```
8.Створіть вектор з часу вимірів і збережіть у змінну myTime. Початок
послідовності – gpsStart, кінець – gpsEnd, крок – st.
```
> myTime <- seq(gpsStart,gpsEnd,st)
> myTime
```
9.Побудуємо графік тільки для першого мільйону вимірів. Для цього створіть
змінну numSamples, яка дорівнює 1000000.
```
numSamples<-1000000
```
10.Побудуйте графік за допомогою функції plot(myTime[0:numSamples],
strain[0:numSamples], type = "l", xlab = "GPS Time (s)", ylab = "H1 Strain")
```
plot(myTime[0:numSamples],strain[0:numSamples], type = "l", xlab = "GPS Time (s)", ylab = "H1 Strain")
```

