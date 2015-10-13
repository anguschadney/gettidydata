# Author: Gus Chadney
# Date:   13/10/2015
#
# Course Project - Getting and Cleaning Data
#
# Create a tidy data set from data collected from the 
# accelerometers from the Samsung Galaxy S smartphone

# Load libraries
library(dplyr)
library(tidyr)

# Download and unzip UCI HAR dataset to current working directory
if (!file.exists("./UCI HAR Dataset.zip")) {
    url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url, destfile="./UCI HAR Dataset.zip")
    unzip("./UCI HAR Dataset.zip")
}

# Load in raw datasets, ensuring that the 'X' measurements are numeric and that the
# 'y' activities and subject test data are factors
train_vals <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses="numeric")
test_vals <- read.table("./UCI HAR Dataset/test/X_test.txt", colClasses="numeric")
train_labels <- read.table("./UCI HAR Dataset/train/y_train.txt", colClasses="factor")
test_labels <- read.table("./UCI HAR Dataset/test/y_test.txt", colClasses="factor")
train_subjects <- read.table("./UCI HAR Dataset/train/subject_train.txt", colClasses="factor")
test_subjects <- read.table("./UCI HAR Dataset/test/subject_test.txt", colClasses="factor")

# Load in the features.txt table ('X' column names), so that we can filter out everything
# that isn't a mean or std variable
features <- read.table("./UCI HAR Dataset/features.txt")
mean_std_idx <- grep("-(mean|std)", features$V2)

# Filter out non mean or std measurements
train_vals <- train_vals[,mean_std_idx]
test_vals <- test_vals[,mean_std_idx]

# Rename the columns in train_vals and test_vals from the features dataset
names(train_vals) <- features[mean_std_idx, 2]
names(test_vals) <- features[mean_std_idx, 2]

# Rename the single column in train_labels and test_labels to "activity"
# and the column in train_subjects and test_subjects to "subjects"
names(train_labels) <- c("activity")
names(test_labels) <- c("activity")
names(train_subjects) <- c("subjects")
names(test_subjects) <- c("subjects")

# Add the subjects and labels as the first and second columns in the two "vals" datasets
train_vals <- cbind(train_subjects, train_labels, train_vals)
test_vals <- cbind(test_subjects, test_labels, test_vals)

# Concatenate the data using rbind
data <- rbind(train_vals, test_vals)

# Get the activity labels and update the activity column to have descriptive values
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
levels(data$activity) <- activity_labels$V2

# 1. Gather the data into a vertical dataset with the "feature" as a column
# 2. Separate the measurement and dimension values out of the feature column
# 3. Group the data by the activity, feature and measurement columns
# 4. Add a column "average" which is the mean of all the "values"
data <- data %>%
    gather(feature, value, -(subjects:activity)) %>%
    separate(feature, into=c("feature","measurement","dimension"), fill="right") %>%
    group_by(subjects, activity, feature, measurement, dimension) %>%
    summarise(averagevalue=mean(value))

# Write the data to tidy_data.txt in the current directory
write.table(data, file="./tidy_data.txt", row.names=FALSE)
