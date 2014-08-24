# Cleaning Data Class Project

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")

unzip("./dataset.zip")

# get variable names
features <- read.table("./UCI HAR Dataset/features.txt")
activities <- read.table("./UCI HAR Dataset/activity_labels.txt")
names(activities) <- c("actcode", "activity")

# load and format test dataset
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
names(test) <- (features$V2)

test_label <- read.table("./UCI HAR Dataset/test/y_test.txt")
names(test_label) <- c("actcode")

test_label <- merge(test_label, activities, by="actcode")

test_sub <- read.table("./UCI HAR Dataset/test/subject_test.txt")
names(test_sub) <- c("subject")

test <- cbind(test, test_label, test_sub)

rm(test_label, test_sub)

#load and formate train dataset
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
names(train) <- (features$V2)

train_label <- read.table("./UCI HAR Dataset/train/y_train.txt")
names(train_label) <- c("actcode")

train_label <- merge(train_label, activities, by="actcode")

train_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(train_sub) <- c("subject")

train <- cbind(train, train_label, train_sub)

rm(train_label, train_sub, features, activities)


#merge test and train datasets
data <- rbind(test, train)
rm(test, train)

#extract means and stdev columns only
pared <- data[, grep("mean|std|activity|subject", names(data))]

#calculate mean of each variable for each subject*activity
library(dplyr)

groups <- group_by(pared, subject, activity)

mean <- summarise_each(groups, funs(mean))

#write out summary table
write.table(mean, "./tidy.txt", row.name=FALSE)

