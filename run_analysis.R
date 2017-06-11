setwd("c:/Petr/dropbox/Dropbox/coursera/data cleaning/gcd-week4")

if (!file.exists("data/")){dir.create('data')}
  

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

all_data <- rbind(train_data,test_data)
