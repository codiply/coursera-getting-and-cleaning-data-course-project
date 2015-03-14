# I download and extract the raw files.
if (!file.exists("./raw")) {
    zipFile <- tempfile()
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url, destfile=zipFile, mode="wb", method="internal")
    unzip(zipFile)
    unlink(zipFile)
    file.rename("UCI HAR Dataset", "raw")
}

# I read all the relevant files into data frames.
features <- read.table("./raw/features.txt", col.names=c("index","name"))
subject_train <- read.table("./raw/train/subject_train.txt", col.names=c("subject"))
subject_test <- read.table("./raw/test/subject_test.txt", col.names=c("subject"))
X_train <- read.table("./raw/train/X_train.txt", col.names=features$name)
X_test <- read.table("./raw/test/X_test.txt", col.names=features$name)
y_train <- read.table("./raw/train/y_train.txt", col.names=c("activityid"))
y_test <- read.table("./raw/test/y_test.txt", col.names=c("activityid"))
activity_labels <- read.table("./raw/activity_labels.txt", col.names=c("activityid", "activity"))

library(dplyr)

# I join the activity id's with their descriptive names and then keep only the names.
y_train$id <- 1:nrow(y_train)
y_test$id <- 1:nrow(y_test)
activity_test <- select(arrange(merge(y_test, activity_labels),id), activity)
activity_train <- select(arrange(merge(y_train, activity_labels),id), activity)

# I extracts only the measurements on the mean and 
# standard deviation for each measurement.
featuresToKeep <- grep("mean\\(\\)|std\\(\\)", features$name)
train <- X_train[,featuresToKeep]
test <- X_test[,featuresToKeep]

# I add the activity column
train$activity <- activity_train$activity
test$activity <- activity_test$activity

# I add the subject information
train$subject <- subject_train$subject
test$subject <- subject_test$subject

# I combined the training and the test sets to create one data set.
merged <- rbind(train, test)

# I remove double dots from column name. (these were originally parentheses "()")
names(merged) <- gsub("\\.\\.","",names(merged))
# I replace dots with underscore in column names.
names(merged) <- gsub("\\.","_",names(merged))

tidy <- aggregate(. ~ activity + subject, data = merged, mean)

# I add "_avg" to the end of the name of each aggregated feature.
names(tidy)[3:ncol(tidy)] <- paste0(names(tidy[3:ncol(tidy)]), "_avg")

# I save the tidy dataset.
write.table(tidy, file="tidy.txt", row.names=FALSE)