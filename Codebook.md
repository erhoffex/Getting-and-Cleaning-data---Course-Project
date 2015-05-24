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

Features from the accelerometer and gyroscope 3-axial raw signals are referred as tAcc-XYZ and tGyro-XYZ (where "t" stands for "time"). 

Then, the acceleration signal was splited into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ). To do this, a low pass Butterworth filter with a corner frequency of 0.3 Hz was applied.

In addition, the Jerk signals (time rate of change) were obtained for both, accelerometer and gyrospcope. These values are stored in tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ respectively. 

The magnitude of these 3D signals were calculated appying the Euclidean norm and the values obtained were stored in the following variables: tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag and tBodyGyroJerkMag.

Another transformation was applied to the signals giving the following variables as resul:fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag and fBodyGyroJerkMag. Where 'f' stands for frequency.

For all these variables, the mean and the standard deviation and the mean frequency were calculated. Altought the objective of this exercise was to take only those features representing the mean and the stadndard deviation, the mean frquency has been also considered in the dataset as it is also reflecting a mean value.

The complete list of variables, in the same order they are stored in the dataset is the following:

1	subject

2	activity

3	tBodyAcc-mean()-X

4	tBodyAcc-mean()-Y

5	tBodyAcc-mean()-Z

6	tBodyAcc-std()-X

7	tBodyAcc-std()-Y

8	tBodyAcc-std()-Z

9	tGravityAcc-mean()-X

10	tGravityAcc-mean()-Y

11	tGravityAcc-mean()-Z

12	tGravityAcc-std()-X

13	tGravityAcc-std()-Y

14	tGravityAcc-std()-Z

15	tBodyAccJerk-mean()-X

16	tBodyAccJerk-mean()-Y

17	tBodyAccJerk-mean()-Z

18	tBodyAccJerk-std()-X

19	tBodyAccJerk-std()-Y

20	tBodyAccJerk-std()-Z

21	tBodyGyro-mean()-X

22	tBodyGyro-mean()-Y

23	tBodyGyro-mean()-Z

24	tBodyGyro-std()-X

25	tBodyGyro-std()-Y

26	tBodyGyro-std()-Z

27	tBodyGyroJerk-mean()-X

28	tBodyGyroJerk-mean()-Y

29	tBodyGyroJerk-mean()-Z

30	tBodyGyroJerk-std()-X

31	tBodyGyroJerk-std()-Y

32	tBodyGyroJerk-std()-Z

33	tBodyAccMag-mean()

34	tBodyAccMag-std()

35	tGravityAccMag-mean()

36	tGravityAccMag-std()

37	tBodyAccJerkMag-mean()

38	tBodyAccJerkMag-std()

39	tBodyGyroMag-mean()

40	tBodyGyroMag-std()

41	tBodyGyroJerkMag-mean()

42	tBodyGyroJerkMag-std()

43	fBodyAcc-mean()-X

44	fBodyAcc-mean()-Y

45	fBodyAcc-mean()-Z

46	fBodyAcc-std()-X

47	fBodyAcc-std()-Y

48	fBodyAcc-std()-Z

49	fBodyAcc-meanFreq()-X

50	fBodyAcc-meanFreq()-Y

51	fBodyAcc-meanFreq()-Z

52	fBodyAccJerk-mean()-X

53	fBodyAccJerk-mean()-Y

54	fBodyAccJerk-mean()-Z

55	fBodyAccJerk-std()-X

56	fBodyAccJerk-std()-Y

57	fBodyAccJerk-std()-Z

58	fBodyAccJerk-meanFreq()-X

59	fBodyAccJerk-meanFreq()-Y

60	fBodyAccJerk-meanFreq()-Z

61	fBodyGyro-mean()-X

62	fBodyGyro-mean()-Y

63	fBodyGyro-mean()-Z

64	fBodyGyro-std()-X

65	fBodyGyro-std()-Y

66	fBodyGyro-std()-Z

67	fBodyGyro-meanFreq()-X

68	fBodyGyro-meanFreq()-Y

69	fBodyGyro-meanFreq()-Z

70	fBodyAccMag-mean()

71	fBodyAccMag-std()

72	fBodyAccMag-meanFreq()

73	fBodyBodyAccJerkMag-mean()

74	fBodyBodyAccJerkMag-std()

75	fBodyBodyAccJerkMag-meanFreq()

76	fBodyBodyGyroMag-mean()

77	fBodyBodyGyroMag-std()

78	fBodyBodyGyroMag-meanFreq()

79	fBodyBodyGyroJerkMag-mean()

80	fBodyBodyGyroJerkMag-std()

81	fBodyBodyGyroJerkMag-meaA2:B82

## Features values

All features have values that are normalized and bounded within [-1,1].

Tha variable subject, that represents the individual for which the data was measured during the test, has integer values from 1 to 30. Each value identifies an unique individual.

Finally, the variable activity contained values from 1 to 6 in the raw data. In order to have more descriptive values in the tidy dataset, these values have been substituded by the activity names: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING. The correspondence between the numbers and the activities has been found in the "activity_labels.txt" file from the original dataset.
