# Code Book for generating the tidy data set

## Steps followed

Below is a short description of the steps followed in order to create the tidy data set from the source data set.

### Download source data set
The [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) containing the source data was downloaded and extracted in a folder named `raw`.

### Read Relevant files

The following files were loaded into data frames:

- `features.txt`: Maps feature id's (essentially column positions in the X data) to their names.
- `subject_train.txt` and `subject_test.txt`: The subject id of each measurement in the train/test data sets respectively.
- `X_train.txt` and `X_test.txt`: Feature values for each measurement in the train/test data sets respectively. The column names have been set to the ones provided by `features.txt` above.
- `y_train.txt` and `y_test.txt`: The activity id for each sample in the train/test data sets respectively.
- `activity_labels.txt`: Maps activity id's to a descriptive name for each activity.

### Map activity id's to descriptive names

In this step I have replaced the activity id's with the corresponding descriptive names.

### Keep mean and standard deviation features only


For `X_test` and `X_train` separately, and for each measurement, I kept only the features that contain `"mean()"` or `"std()"` in their name.

### Merge X, y, and subject data


For test and train separately, and for each measurement, I have merged X, y and subject data into one data frame.

### Combine test and train data sets.


I have combined the test and train data sets into one.

### Clean up feature names


- I have replaced double dots `..` with spaces (double dots appear in places where parentheses `()` were present in the original names).
- Next, I have replaced remaining single dots `.` with underscores `_`.

### Average features by activity and subject

A tidy data set was crated after

- I have calculated the average of each feature for specific activity and subject. 
- I have appended the string `"_avg"` to the end of the name of each aggregated feature.

### Save tidy data set.

The tidy data set was saved in `tidy.txt` in space-separated format. Column names were included in the header of the file while row indexes were omitted.

## Variables in tidy data set

- `activity`     
- `subject`     
- `tBodyAcc_mean_X_avg`     
- `tBodyAcc_mean_Y_avg`     
- `tBodyAcc_mean_Z_avg`     
- `tBodyAcc_std_X_avg`    
- `tBodyAcc_std_Y_avg`     
- `tBodyAcc_std_Z_avg`     
- `tGravityAcc_mean_X_avg`     
- `tGravityAcc_mean_Y_avg`     
- `tGravityAcc_mean_Z_avg`     
- `tGravityAcc_std_X_avg`     
- `tGravityAcc_std_Y_avg`     
- `tGravityAcc_std_Z_avg`     
- `tBodyAccJerk_mean_X_avg`     
- `tBodyAccJerk_mean_Y_avg`     
- `tBodyAccJerk_mean_Z_avg`     
- `tBodyAccJerk_std_X_avg`     
- `tBodyAccJerk_std_Y_avg`     
- `tBodyAccJerk_std_Z_avg`     
- `tBodyGyro_mean_X_avg`     
- `tBodyGyro_mean_Y_avg`     
- `tBodyGyro_mean_Z_avg`     
- `tBodyGyro_std_X_avg`     
- `tBodyGyro_std_Y_avg`     
- `tBodyGyro_std_Z_avg`     
- `tBodyGyroJerk_mean_X_avg`     
- `tBodyGyroJerk_mean_Y_avg`     
- `tBodyGyroJerk_mean_Z_avg`     
- `tBodyGyroJerk_std_X_avg`     
- `tBodyGyroJerk_std_Y_avg`     
- `tBodyGyroJerk_std_Z_avg`     
- `tBodyAccMag_mean_avg`     
- `tBodyAccMag_std_avg`     
- `tGravityAccMag_mean_avg`     
- `tGravityAccMag_std_avg`     
- `tBodyAccJerkMag_mean_avg`     
- `tBodyAccJerkMag_std_avg`     
- `tBodyGyroMag_mean_avg`     
- `tBodyGyroMag_std_avg`     
- `tBodyGyroJerkMag_mean_avg`     
- `tBodyGyroJerkMag_std_avg`     
- `fBodyAcc_mean_X_avg`     
- `fBodyAcc_mean_Y_avg`     
- `fBodyAcc_mean_Z_avg`     
- `fBodyAcc_std_X_avg`     
- `fBodyAcc_std_Y_avg`     
- `fBodyAcc_std_Z_avg`     
- `fBodyAccJerk_mean_X_avg`     
- `fBodyAccJerk_mean_Y_avg`     
- `fBodyAccJerk_mean_Z_avg`     
- `fBodyAccJerk_std_X_avg`     
- `fBodyAccJerk_std_Y_avg`     
- `fBodyAccJerk_std_Z_avg`     
- `fBodyGyro_mean_X_avg`     
- `fBodyGyro_mean_Y_avg`     
- `fBodyGyro_mean_Z_avg`     
- `fBodyGyro_std_X_avg`     
- `fBodyGyro_std_Y_avg`     
- `fBodyGyro_std_Z_avg`     
- `fBodyAccMag_mean_avg`     
- `fBodyAccMag_std_avg`     
- `fBodyBodyAccJerkMag_mean_avg`     
- `fBodyBodyAccJerkMag_std_avg`     
- `fBodyBodyGyroMag_mean_avg`     
- `fBodyBodyGyroMag_std_avg`     
- `fBodyBodyGyroJerkMag_mean_avg`     
- `fBodyBodyGyroJerkMag_std_avg`

