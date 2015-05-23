## File name: run_analysis.R
## Author: W.S. Hoekstra
## Date 23-05-2015
##
## Note: this script assumes that the source files
## (available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
## have been downloaded 
## and unzipped in the current working directory, with relative paths.

## Load some libraries
library(plyr)
library(dplyr)

## Read features file
features <- read.table(paste(getwd(),"/UCI HAR Dataset/features.txt", sep = ""), header = FALSE)


## Read, merge test data (data, subject, activity label)
x_test <- read.table(paste(getwd(),"/UCI HAR Dataset/test/X_test.txt", sep = ""), header = FALSE)
colnames(x_test) <- features[,2]
subject_test <- read.table(paste(getwd(),"/UCI HAR Dataset/test/subject_test.txt", sep = ""), header = FALSE)
colnames(subject_test) <- "subject"
subject_test$subject <- factor(subject_test$subject)
y_test <- read.table(paste(getwd(),"/UCI HAR Dataset/test/y_test.txt", sep = ""), header = FALSE)
colnames(y_test) <- "activity_code"
y_test$activity_name[y_test$activity_code=="1"] <- "walking"
y_test$activity_name[y_test$activity_code=="2"] <- "walking upstairs"
y_test$activity_name[y_test$activity_code=="3"] <- "walking downstairs"
y_test$activity_name[y_test$activity_code=="4"] <- "sitting"
y_test$activity_name[y_test$activity_code=="5"] <- "standing"
y_test$activity_name[y_test$activity_code=="6"] <- "laying"
y_test$activity_name <- factor(y_test$activity_name)
test_data <- data.frame()
test_data <- cbind(y_test, subject_test, x_test)

## Read, merge training data (data, subject, activity label)
x_train <- read.table(paste(getwd(),"/UCI HAR Dataset/train/X_train.txt", sep = ""), header = FALSE)
colnames(x_train) <- features[,2]
subject_train <- read.table(paste(getwd(),"/UCI HAR Dataset/train/subject_train.txt", sep = ""), header = FALSE)
colnames(subject_train) <- "subject"
subject_train$subject <- factor(subject_train$subject)
y_train <- read.table(paste(getwd(),"/UCI HAR Dataset/train/y_train.txt", sep = ""), header = FALSE)
colnames(y_train) <- "activity_code"
y_train$activity_name[y_train$activity_code=="1"] <- "walking"
y_train$activity_name[y_train$activity_code=="2"] <- "walking upstairs"
y_train$activity_name[y_train$activity_code=="3"] <- "walking downstairs"
y_train$activity_name[y_train$activity_code=="4"] <- "sitting"
y_train$activity_name[y_train$activity_code=="5"] <- "standing"
y_train$activity_name[y_train$activity_code=="6"] <- "laying"
y_train$activity_name <- factor(y_train$activity_name)
train_data <- data.frame()
train_data <- cbind(y_train, subject_train, x_train)

## Merge test and training data
merged_data <- data.frame()
merged_data <- rbind(test_data,train_data)

## Extract activity names, subjects, columns which contain stdevs or means
merged_mean_cols <- merged_data[,grep("mean", tolower(names(merged_data)))]
merged_std_cols <- merged_data[,grep("std", tolower(names(merged_data)))]
merged_data2 <- data.frame()
merged_data2 <- cbind(merged_data$activity_name,merged_data$subject,merged_mean_cols,merged_std_cols)
colnames(merged_data2)[which(names(merged_data2) == "merged_data$activity_name")] <- "activity"
colnames(merged_data2)[which(names(merged_data2) == "merged_data$subject")] <- "subject"
#colnames(merged_data2) <- gsub(x = colnames(merged_data2), "(","", fixed = TRUE)
#colnames(merged_data2) <- gsub(x = colnames(merged_data2), ")","", fixed = TRUE)
#colnames(merged_data2) <- gsub(x = colnames(merged_data2), "-","", fixed = TRUE)
merged_data2$subject <- (as.numeric(as.character(merged_data2$subject)))

## Calculate variables means by subject and activity
tidy_data <- group_by(merged_data2, subject, activity) %>% summarise_each(funs(mean))

## remove waste variables
rm(features)
rm(merged_data)
rm(merged_data2)
rm(merged_mean_cols)
rm(merged_std_cols)
rm(subject_test)
rm(subject_train)
rm(test_data)
rm(train_data)
rm(x_test)
rm(x_train)
rm(y_test)
rm(y_train)


## Write tidy data set to file
write.table(tidy_data,"tidy_data.txt",row.name = FALSE)
