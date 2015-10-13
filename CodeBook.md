# Course Project - Getting and Cleaning Data

## Author

Gus Chadney <angus.chadney@gmail.com>

## Introduction

This file is a code book used to describe the tidied data file **tidy_data.txt**
The file was generated as a result of an R algorithm applied to data collected from the accelerometers from the Samsung Galaxy S smartphone (please see README.md for more information)

## Data

This data shows the average value of a set of measurements (features) corresponding to an activity and a subject
The features have been split into the basic sensor, the measurement type, and a dimension if appropriate

## Features

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

## Variables

1. **subjects:** Numeric variable corresponding to the number assigned to each subject
2. **activity:** Factor variable corresponding to the activity each subject was performing, valid values are:
 * 1 WALKING
 * 2 WALKING_UPSTAIRS
 * 3 WALKING_DOWNSTAIRS
 * 4 SITTING
 * 5 STANDING
 * 6 LAYING
3. **feature:** Name of a particular feature, examples include fBodyAccJerk, fBodyGyro, tBodyGyroJerkMag...
4. **measurement:** Measurement type, valid values are:
 * mean
 * std
5. **dimension:** Dimension of a particular feature, valid values are:
 * x
 * y
 * z
 * (blank, not applicable to feature)
6. **averagevalue** Average value of measurements for the particular feature, normalised between -1 and 1

## Transformations

* Data from the following datasets was combined:
 * Features or measurements datasets (X_train.txt, X_test.txt)
 * Activity labels datasets (y_train.txt, y_test.txt)
 * Subject values datasets (subject_train.txt, subject_test.txt)
* Activity labels were converted to descriptive values from activity_labels.txt
* Descriptive column names were added from features.txt
* Data was gathered into a vertical dataset by adding features, measurement and dimension columns to replace the feature specific column names
* Data was grouped by subject, activity, features, measurement and dimension columns
* Value (or measurement) was averaged with the above groupings
