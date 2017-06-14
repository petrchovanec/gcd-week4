setwd("c:/Petr/dropbox/Dropbox/coursera/data cleaning/gcd-week4")
library(tidyverse)

if (!dir.exists("data/")){dir.create('data')}
  

if (!file.exists("data/Samsung.zip")){
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                destfile = "data/Samsung.zip")
}

train_x <- read.table(file=unz('data/Samsung.zip','UCI HAR Dataset/train/X_train.txt'))
train_y <- read.table(file=unz('data/Samsung.zip','UCI HAR Dataset/train/y_train.txt'))
train_subject <- read.table(file=unz('data/Samsung.zip','UCI HAR Dataset/train/subject_train.txt'))

train_data <- cbind(train_subject,train_y,train_x)

test_x <- read.table(file=unz('data/Samsung.zip','UCI HAR Dataset/test/X_test.txt'))
test_y <- read.table(file=unz('data/Samsung.zip','UCI HAR Dataset/test/y_test.txt'))
test_subject <- read.table(file=unz('data/Samsung.zip','UCI HAR Dataset/test/subject_test.txt'))
test_data <- cbind(test_subject,test_y,test_x)

features <- read.table(file=unz('data/Samsung.zip','UCI HAR Dataset/features.txt'))

#1. Merges the training and the test sets to create one data set.
all_data <- rbind(train_data,test_data)

#4. Appropriately labels the data set with descriptive variable names.
names(all_data) <- c("Subject","Activity",as.character(features$V2))

#2. Extracts only the measurements on the mean and standard deviation for each measurement.
nrs <-c(1,2,grep('mean\\((\\))',names(all_data)), grep('std\\((\\))',names(all_data)))
all_data <- all_data[,nrs]

#3. Uses descriptive activity names to name the activities in the data set
activities <- read.table(file=unz('data/Samsung.zip','UCI HAR Dataset/activity_labels.txt'))
names(activities) <- c("Activity","Name")
auxcol <- left_join(data.frame(Activity=all_data[,2]), activities, by="Activity")
all_data[,2] <- auxcol[,2]

#4 is above

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_mean_all_data <- all_data %>% group_by(Activity, Subject) %>% summarize_all(mean)

write.table(tidy_mean_all_data,file = "tidydataset.txt",row.names = FALSE)
