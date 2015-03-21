# Introduction

Here we use `run_analysis.R` script which performs five steps described in the assignment.

* Step 1: merging similar data using the `rbind()` function. 
* Step 2: getting mean and standard deviation columns only from the whole dataset and naming them with the correct names. 
* Step 3: reading activity data (values 1:6), taking the activity names and IDs from `activity_labels.txt` and then substituted in the dataset.
* Step 4: correcting column names.
* Step 5: generating a new dataset containing all average values (30 subjects each for 6 activities, 180 rows), naming the output file `averages_data.txt`.

# Variables

* `x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the original data.
* `x_merged_data`, `y_merged_data` and `subject_merged_data` are merged datasets.
* `features` contains the correct names for the `x_merged_data`, which are used as column names saved in `mean_and_stdev_features`.
* applying the same approach to `activities` variable.
* merging `x_merged_data`, `y_merged_data` and `subject_merged_data` in to `all_dataset`.
* creating `averages_data` containing relevant average values then saved to `averages_data.txt`.
