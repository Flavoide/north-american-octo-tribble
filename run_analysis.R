# For each record in the dataset it is provided: 
# - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
# - Triaxial Angular velocity from the gyroscope. 
# - A 561-feature vector with time and frequency domain variables. 
# - Its activity label. 
# - An identifier of the subject who carried out the experiment.

#imports
library(data.table)

#setting up
setwd("C:/Users/nuno.teixeira/Google Drive/mooc/Getting and Cleaning Data/project/UCI HAR Dataset/")
activityFiles <- c("./train/Y_train.txt", "./test/Y_test.txt")
subjectsFiles  <- c("./train/subject_train.txt", "./test/subject_test.txt")
featuresFiles <- c("./train/X_train.txt", "./test/X_test.txt")
featuresDescPath <- "./features.txt"

#initialization
resultingDF <- data.frame(matrix(ncol = 2, nrow = 10299))
columnNames <- c("subjectID", "activity")
activitiesDescription <- c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING")

#Merges the training and the test sets to create one data set.
resultingDF[,1] <- do.call(rbind, lapply(subjectsFiles, function(fn) fread(fn, header=F)))
resultingDF[,2] <- do.call(rbind, lapply(activityFiles, function(fn) fread(fn, header=F)))

#Extracts only the measurements on the mean and standard deviation for each measurement. 
featuresInfo <- fread(featuresDescPath, header=FALSE)
relevantFeatures <- featuresInfo[grep("mean\\(\\)|std\\(\\)", featuresInfo$V2), ]
relevantColsIndex<-relevantFeatures$V1
relavantColsNames<-relevantFeatures$V2

fullFeaturesDF<-do.call(rbind, lapply(featuresFiles, function(fn) read.table(fn, header=F)))
featuresDF<-fullFeaturesDF[,relevantColsIndex]
resultingDF <- cbind(resultingDF, featuresDF)

#Appropriately labels the data set with descriptive variable names. 
columnNames<-c(columnNames, relavantColsNames)
columnNames <- adjustVariableNames(columnNames)
setnames(resultingDF, columnNames)

#Uses descriptive activity names to name the activities in the data set
resultingDF$activity <- sapply(resultingDF$activity, function(x) activitiesDescription[as.numeric(x)])

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
dataToGroup<- resultingDF[,3:68]
aggregatedDF <- aggregate(dataToGroup, by=resultingDF[c("subjectID", "activity")], FUN=mean)

write.table(aggregatedDF, file="result.txt", row.names=FALSE)





adjustVariableNames <- function(colsNames)
{

	result <- gsub("-mean\\(\\)", "Mean", colsNames)
	result <- gsub("-std\\(\\)", "Std", colsNames)

	return result;
}