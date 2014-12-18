#Experimental design and background
Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors. 
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

#Raw data
Identification of the subject who carried out the experiment, its activity label, accelerometer and gyroscope 3-axial raw signals (tAcc-XYZ and tGyro-XYZ), body and gravity acceleration signals separated from the acceleration signal (tBodyAcc-XYZ and tGravityAcc-XYZ), Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ) calculated from deriving body linear acceleration and angular velocity in time, magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag), frequency domain signals after applied a Fast Fourier Transform (fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag). 

To each of the previous signals was estimated the following variables:
* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

NOTE: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

#Processed data description
The activity was converted to a text description.
Filter the measured signals to only include those regarding the mean and the standar deviation.
Only the variables which name ended with 'std()' or 'mean()' were included. This variables represents the mean and standard deviation from the origianl measured signals. All other variables were dropped. 
For each unique activity performed by each subject all of the varibles were summarized, and the mean of the observations for that pair, estimated.

Signals were summarized for each subject and activity

# Notes:
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.