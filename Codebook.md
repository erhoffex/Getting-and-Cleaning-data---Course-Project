# Data Source

This data frame corersponds to an experiment to measure human activity by using a smartphone.

The experiments was carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. 
The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

# Tidy Data

Starting from these two datasets (training and test), we have built a new data frame containing the data from both. The resulting dataset contains the measurements done for 30 different individuals.

## Activity names

To make the dataset more easy to read, we have renamed the activities according to the information provided in the "activity_labels.txt" file from the original dataset. Therefore, instead of been called by numbers between 1 and 6, activities received more descriptive names: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING


## Features selection

Features are measured by using the accelerometer and the gyroscope from a Samsung Galaxy S II smartphone as described before.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force was assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Features from the accelerometer and gyroscope 3-axial raw signals are referred as tAcc-XYZ and tGyro-XYZ (where "t" stands for "time")

Then, the acceleration signal was splited into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). To do this, a low pass Butterworth filter with a corner frequency of 0.3 Hz was applied.

VOY POR AQUI RETOCANDO:
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
