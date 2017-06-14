# Getting and Cleaning Data Course Project (Week 4)

 

## How to run

 

You can run the run_analysis.R file.

 

## File - run_analysis.R

 

The run_analysis.R file fulfills requirements of the course project:

 

1. Merges the training and the test sets to create one data set.

1. Extracts only the measurements on the mean and standard deviation for each measurement.

1. Uses descriptive activity names to name the activities in the data set

1. Appropriately labels the data set with descriptive variable names.

1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

 

 

## Cleaning Process

 

1. Load a tidyverse library

1. Checks whether the data dictionary is in the working directory, if not, creates it

1. Checks whether the data file is in the data directory from the previous step, if not, downloads it

1. Reads the table with x variables in the training dataset into the train_x variable from the zip file downloaded in the previous step

1. Reads the table with y variables in the training dataset into the train_x variable from the zip file downloaded in the previous step

1. Reads the table with subject numbers variables in the training dataset into the train_x variable from the zip file downloaded in the previous step

1. Combines the previous data frames into one, the training dataset

1. Reads the table with x variables in the testing dataset into the train_x variable from the zip file downloaded in the previous step

1. Reads the table with y variables in the testing dataset into the train_x variable from the zip file downloaded in the previous step

1. Reads the table with subject numbers variables in the testing dataset into the train_x variable from the zip file downloaded in the previous step

1. Combines the previous data frames into one, the testing dataset

1. Reads feature (variable) names from the file

1. Combines test and training datasets into one (1.)

1. Labels all variables by its features name (4.)

1. Restricts variables only to those that are measurements on mean and standard variation (2.)

1. Loads activity names and replaces it in the dataset

1. Creates another tidy dataset that reports average of each variable for each subject

1. Saves the file

 

## Results

 

The resulting file, tidydataset.txt, is created using the write.table function.

 

 