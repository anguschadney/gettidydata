# Course Project - Getting and Cleaning Data

## Author

Gus Chadney <angus.chadney@gmail.com>

## Instructions

Run the script `run\_analysis.R` to generate an output file `tidy_data.txt`

## Data Source

This project uses the "Human Activity Recognition Using Smartphones Dataset" 
downloaded to ./Dataset.zip by run\_analysis.R from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

## Project Goals

1. Merge the training and the test sets to create one data set
2. Extract only the measurements on the mean and standard deviation for each measurement
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject

## Input Files

The source files used to create the tidy data set from the extracted data archive (contained in the "UCI HAR Dataset" directory) are:

* train/X_train.txt: Table of numerical values corresponding to a measurement of a feature (training set)
* train/y_train.txt: List of the activity labels correspoding to a particular set of measurements (training set)
* train/subject_train.txt: List of the subject numbers correspoding to a particular set of measurements (training set)
* test/X_test.txt: Table of numerical values corresponding to a measurement of a feature (test set)
* test/y_test.txt: List of the activity labels correspoding to a particular set of measurements (test set)
* test/subject_test.txt: List of the subject numbers correspoding to a particular set of measurements (test set)
* features.txt: List of all the particular features, of which the measurements have been recorded
* activity_labels.txt: Links the values of the activity labels to an descriptive activity

## Script Walkthrough

1. Download and unzip UCI HAR dataset to current working directory
2. Load in raw datasets (see Input Files above)
3. Remove columns that do not correspond to a mean or std measurement
4. Rename the columns in the measurements data sets with the features data set
5. Concatenate the subjects, activities and measurements datasets into one dataset (for training and test)
6. Concatenate the training and test datasets
7. Use the activity_labels data set to add descriptive information to the activity column
8. Gather the data into a vertical dataset with the "feature" as a column
9. Separate the measurement and dimension values out of the feature column
10. Group the data by the activity, feature and measurement columns
11. Add a column "average" which is the mean of all the "values"
12. Write the data to "./tidy_data.txt"

## Output File

Please see CodeBook.md for a description of the output file "./tidy_data.txt"