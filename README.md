# Getting-and-Cleaning-data---Course-Project
This repo contains the Course Project from the Getting and Cleaning data course from Coursera

There is an unique script needed (code below).
This script goes through all steps from the course project and it has been indicated with comments which parts of the code corresponds with the different steps of the course project.

The output from step 1 is in the data frame named "mergedData".

The output from step 2 is in the data frame named "mergedDataMeanStd".

The output from steps 3 and 4 are in both, mergedData and mergedDataMeanStd.

Finally, the output from step 5 in in the data frame called "tidyData" and it is also extracted to a txt file called "project_result.txt".

After running the script, the data can be visualize by doing the following:

data <- read.table('project_result.txt', header = TRUE)

View(data)


The script (without comments) is below. The complete version of the script with all comments is included into this GitHub repository under the name "run_analysis.R"


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

## FINALLY: EXPORT TIDYDATA INTO A TXT FILE IN THE WORKING DIRECTORY AND THE DATAFRAME IS RETURNED
write.table(tidyData, 'project_result.txt', row.name=FALSE)

tidyData
