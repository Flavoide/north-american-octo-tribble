# Getting and Cleaning Data
This is the final project for the Getting and Cleaning Data course, available at https://class.coursera.org/getdata-016.

## REQUIREMENTS
This script does not requires any additional library to the core R framework.

## CONFIGURATION

This script works as long as the Samsung data, available in [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) is in your working directory.

## Tidy dataset construction

The tidy data set is created as follows:
1. Merges the training and the test sets to create one data set.
..* The datasets are loaded using fread to performance improvement.
..* Same variables from differente data sets are merged using rbind.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
..* This step is done in two phases:
..1. First, determine wich measurements will be used
..* This is done considering only the features that contains the substring 'std()' or 'mean()' in the feature name, according to features.txt file.
..2. Second, load the features vector and subset it to include only the variables determined in the previous step.
3. Appropriately labels the data set with descriptive variable names.
..* A simple treatment is done in the variables name, in order to make it more human readable
4. Uses descriptive activity names to name the activities in the data set
..* Replace the numeric indentification of the activity, to it's corresponding description
5. Create a tidy data set with the average of each variable for each activity and subject
..* What is done is to aggregate all the observations for each unique pair (subject,activity), and then calculate the mean for all of the variables considered.
6. The result of the previous step is then saved in a file named result.txt, in the working directory.

## EXAMPLE
Just call the script with R without arguments, and wait. The result is written in result.txt file, stored in the same directory.