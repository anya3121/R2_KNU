
Об'єднання
```
URL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(URL, destfile = paste0(getwd(), '/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'), method = "curl")

x_train<-read.table('data/UCI HAR Dataset/train/X_train.txt')'
names(x_train) <- features
y_train<- read.csv('data/UCI HAR Dataset/train/y_train.txt', header = FALSE, sep = ' ')
names(y_train) <- c("Activity")
subject_train <- read.csv('data/UCI HAR Dataset/train/subject_train.txt',header = FALSE, sep = ' ')
names(subject_train)<-c("Subject")

train<- data.frame(subject_train, y_train, x_train)
```
```
x_test <- read.table('data/UCI HAR Dataset/test/X_test.txt')
names(x_test) <- features
y_test <- read.csv('data/UCI HAR Dataset/test/y_test.txt', header = FALSE, sep = ' ')
names(y_test) <- c("Activity")
subject_test <- read.csv('data/UCI HAR Dataset/test/subject_test.txt', header = FALSE, sep = ' ')
names(subject_test) <- c("Subject")

test<- data.frame(subject_test, y_test, x_test)
```
1. Об’єднання навчального та тестового набору, щоб створити один набір даних
```
data_base<-rbind(train, test)
```
2. Витягнути лише вимірювання середнього значення та стандартного відхилення (mean and standard deviation) для кожного вимірювання.
```
mean_std <- grep('mean|std', features)
sub_data_base <- data_base[, c(1, 2, mean_std+2)]
```
3.Використати описові назви діяльностей (activity) для найменування діяльностей у наборі даних 
activity_labels <- read.table('data/UCI HAR Dataset/activity_labels.txt', header = FALSE)
activity_labels <- as.character(activity_labels[,2])
sub_data_base$Activity <- activity_labels[sub_data_base$Activity]
```
4. відповідно присвоїти змінним у наборі даних описові імена
```
 name_new <- names(sub_data_base)
 name_new <- gsub("[(][)]", "", name_new)
 name_new <- gsub("^t", "TimeDomain_", name_new)
 name_new <- gsub("^f", "FrequencyDomain_", name_new)
 name_new <- gsub("Acc", "Accelerometer", name_new)
 name_new <- gsub("Gyro", "Gyroscope", name_new)
 name_new <- gsub("Mag", "Magnitude", name_new)
 name_new <- gsub("-mean-", "_Mean_", name_new)
 name_new <- gsub("-std-", "_StandardDeviation_", name_new)
 name_new <- gsub("-", "_", name_new)
 names(data_base) <- name_new
```
5.З набору даних з кроку 4 створити другий незалежний акуратний набір
даних (tidy dataset) із середнім значенням для кожної змінної для кожної
діяльності та кожного суб’єкту (subject).
```
 data_tidy <- aggregate(sub_data_base[,3:81], by = list(activity = sub_data_base$Activity, subject = sub_data_base$Subject),FUN = mean)
 write.table(x = data_tidy, file = "data_tidy.txt", row.names = FALSE)
```



