## NEEDED LIBRARIES
library(dplyr)

## IMPORT TEST DATA
subjectTest <- read.table(file = "UCI HAR Dataset/test/subject_test.txt")
activityTest <- read.table(file = "UCI HAR Dataset/test/y_test.txt")
activityDataTest <- read.table(file = "UCI HAR Dataset/test/X_test.txt")

## IMPORT TRAINING DATA
subjectTrain <- read.table(file = "UCI HAR Dataset/train/subject_train.txt")
activityTrain <- read.table(file = "UCI HAR Dataset/train/y_train.txt")
activityDataTrain <- read.table(file = "UCI HAR Dataset/train/X_train.txt")

## MERGE TEST DATA IN TESTDATA DATA FRAME
testData <- cbind(subjectTest, activityTest, activityDataTest)

## MERGE TRAINING DATA IN TRAININGDATA DATA FRAME
trainingData <- cbind(subjectTrain, activityTrain, activityDataTrain)

## MERGE BOTH TOGETHER, TRAINING DATA AND TEST DATA INTO MERGEDDATA DATA FRAME
mergedData <- rbind (trainingData, testData)

################################################################################
## THIS STEP CORRESPONDS TO THE STEPS 3 AND 4 OF THE PROJECT DESCRIPTION      ##
################################################################################

## RENAME THE MERGEDDATA COLUMNS: get the names from the fetaures.txt file
## The first two columns will be called subject and activity respectively
features <- read.table(file="UCI HAR Dataset/features.txt")
vectorNames <- as.character(features[,2])
names(mergedData) <- c("subject", "activity", vectorNames)

## RENAME THE ACTIVITY NAMES WITH DESCRIPTIVE NAMES FROM ACTIVITY_LAVELS.TXT FILE
activityLabels <- read.table(file="UCI HAR Dataset/activity_labels.txt")
vectorActivityNames <- as.character(activityLabels[,2])
mergedData$activity <- as.factor(mergedData$activity)
levels(mergedData$activity) <- vectorActivityNames 
mergedData$activity<- as.character(mergedData$activity)


################################################################################
## THIS STEP CORRESPONDS TO THE STEPS 2 OF THE PROJECT DESCRIPTION            ##
################################################################################

meanNames <- grepl("mean", vectorNames)
stdNames <- grepl("std", vectorNames)
meanStdNames <- meanNames + stdNames

## DETERMINE THE COLUMNS WHERE THE MEAN OR THE STD IS MEASURED
vectPositions <- which(meanStdNames %in% 1)  
## NOW WE SHOULD CONSIDER THE FIRST TWO COLUMNS: subject and activity
vectPositionsFinal <- c(1,2,vectPositions+2)

## USE THIS VECTOR OF POSITIONS TO FILTER THE DATAFRAME INTO A NEW FILTERED ONE CONTAINING ONLY MEAN AND STD MEASUREMENTS
mergedDataMeanStd <- mergedData[,vectPositionsFinal]  ## This includes columns called meanFreq. We assumed this are also requested for this project, otherwise they must be filtered


################################################################################
## THIS STEP CORRESPONDS TO THE STEPS 5 OF THE PROJECT DESCRIPTION            ##
################################################################################

## CREATE A NEW DATA FRAME CALLED TIDYDATA WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND SUBJECT

# Columns to group by: subject and activity
grp_cols <- names(mergedDataMeanStd)[1:2]

# Convert character vector to list of symbols in order to use it later in the group_by clause
#dots <- lapply(grp_cols, as.symbol)

# For each subject and activity (used to group by) the mean of each column is calculated
tidyData <- mergedDataMeanStd %>%
        group_by_(.dots=grp_cols) %>%
        summarise_each(funs(mean))

## FINALLY: EXPORT TIDYDATA INTO A TXT FILE IN THE WORKING DIRECTORY
write.table(tidyData, 'project_result.txt', row.name=FALSE)

tidyData
