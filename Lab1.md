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
```
      group            name       otype  dclass      dim
0                    /            meta   H5I_GROUP                 
1                /meta     Description H5I_DATASET  STRING    ( 0 )
2                /meta  DescriptionURL H5I_DATASET  STRING    ( 0 )
3                /meta        Detector H5I_DATASET  STRING    ( 0 )
4                /meta        Duration H5I_DATASET INTEGER    ( 0 )
5                /meta        GPSstart H5I_DATASET INTEGER    ( 0 )
6                /meta     Observatory H5I_DATASET  STRING    ( 0 )
7                /meta            Type H5I_DATASET  STRING    ( 0 )
8                /meta        UTCstart H5I_DATASET  STRING    ( 0 )
9                    /         quality   H5I_GROUP                 
10            /quality          detail   H5I_GROUP                 
11            /quality      injections   H5I_GROUP                 
12 /quality/injections InjDescriptions H5I_DATASET  STRING        5
13 /quality/injections   InjShortnames H5I_DATASET  STRING        5
14 /quality/injections         Injmask H5I_DATASET INTEGER     4096
15            /quality          simple   H5I_GROUP                 
16     /quality/simple  DQDescriptions H5I_DATASET  STRING        7
17     /quality/simple    DQShortnames H5I_DATASET  STRING        7
18     /quality/simple          DQmask H5I_DATASET INTEGER     4096
19                   /          strain   H5I_GROUP                 
20             /strain          Strain H5I_DATASET   FLOAT 16777216
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
