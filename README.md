# Getting-and-Cleaning-data---Course-Project
This repo contains the Course Project from the Getting and Cleaning data course from Coursera

This is the unique script needed:

library(dplyr)

## THIS STEP CORRESPONDS TO THE STEPS 1 OF THE PROJECT DESCRIPTION
subjectTest <- read.table(file = "UCI HAR Dataset/test/subject_test.txt")
activityTest <- read.table(file = "UCI HAR Dataset/test/y_test.txt")
activityDataTest <- read.table(file = "UCI HAR Dataset/test/X_test.txt")
subjectTrain <- read.table(file = "UCI HAR Dataset/train/subject_train.txt")
activityTrain <- read.table(file = "UCI HAR Dataset/train/y_train.txt")
activityDataTrain <- read.table(file = "UCI HAR Dataset/train/X_train.txt")

testData <- cbind(subjectTest, activityTest, activityDataTest)

trainingData <- cbind(subjectTrain, activityTrain, activityDataTrain)

mergedData <- rbind (trainingData, testData)

## THIS STEP CORRESPONDS TO THE STEPS 3 AND 4 OF THE PROJECT DESCRIPTION

features <- read.table(file="UCI HAR Dataset/features.txt")
vectorNames <- as.character(features[,2])
names(mergedData) <- c("subject", "activity", vectorNames)

activityLabels <- read.table(file="UCI HAR Dataset/activity_labels.txt")
vectorActivityNames <- as.character(activityLabels[,2])
mergedData$activity <- as.factor(mergedData$activity)
levels(mergedData$activity) <- vectorActivityNames 
mergedData$activity<- as.character(mergedData$activity)


## THIS STEP CORRESPONDS TO THE STEPS 2 OF THE PROJECT DESCRIPTION          

meanNames <- grepl("mean", vectorNames)
stdNames <- grepl("std", vectorNames)
meanStdNames <- meanNames + stdNames

vectPositions <- which(meanStdNames %in% 1)  
vectPositionsFinal <- c(1,2,vectPositions+2)

mergedDataMeanStd <- mergedData[,vectPositionsFinal]  ## This includes columns called meanFreq. We assumed this are also requested for this project, otherwise they must be filtered

## THIS STEP CORRESPONDS TO THE STEPS 5 OF THE PROJECT DESCRIPTION            

grp_cols <- names(mergedDataMeanStd)[1:2]
tidyData <- mergedDataMeanStd %>%
        group_by_(.dots=grp_cols) %>%
        summarise_each(funs(mean))

## FINALLY: EXPORT TIDYDATA INTO A CSV FILE IN THE WORKING DIRECTORY
write.csv(tidyData, 'project_result.csv')
