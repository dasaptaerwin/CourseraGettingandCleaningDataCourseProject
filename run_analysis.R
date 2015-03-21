# Preparation
## Loading plyr package
library(plyr)

# Step 1: Merging training and test sets to one data set
## Reading training data set
x_train <- read.table("X_train.txt")
y_train <- read.table("y_train.txt")
subject_train <- read.table("subject_train.txt")

## Reading test data set
x_test <- read.table("X_test.txt")
y_test <- read.table("y_test.txt")
subject_test <- read.table("subject_test.txt")

## Creating merged data set 
x_merged_data <- rbind(x_train, x_test)
y_merged_data <- rbind(y_train, y_test)
subject_merged_data <- rbind(subject_train, subject_test)

# Step 2: Extracting only the mean and standard deviation for each measurement
## Loading features data set
features <- read.table("features.txt")

## Getting only columns with mean() or std() 
mean_and_stdev_features <- grep("-(mean|std)\\(\\)", features[, 2])
x_merged_data <- x_merged_data[, mean_and_stdev_features]

## Correcting column names
names(x_merged_data) <- features[mean_and_stdev_features, 2]

# Step 3: Naming the activities in the data set using descriptive activity names 
## Reading activity labels
activities <- read.table("activity_labels.txt")

## Updating activity names
y_merged_data[, 1] <- activities[y_merged_data[, 1], 2]
names(y_merged_data) <- "activity"

# Step 4: Labeling the data set using descriptive variable names

## Correcting column name
names(subject_merged_data) <- "subject"

## Binding all data 
all_dataset <- cbind(x_merged_data, y_merged_data, subject_merged_data)

# Step 5: Creating tidy data set 
averages_data <- ddply(all_dataset, .(subject, activity), function(x) colMeans(x[, 1:66]))
write.table(averages_data, "averages_data.txt", row.name=FALSE)

