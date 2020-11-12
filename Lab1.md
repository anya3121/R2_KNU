
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
