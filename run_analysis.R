## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##
## Getting and Cleaning Data - Final Course Project
##
## Author: Agustín Da Fieno Delucchi
##
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 0. Setting environment and loading data
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

## Load required libraries
print("Loading required components...")
require(plyr)
require(dplyr)
require(reshape2)

## Dowload and unzip data file
file.Url <- "http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip"
download.file(file.Url, destfile = "UCIHARDataset.zip")
unzip("UCIHARDataset.zip")

## Set the working directory to "./data"
setwd("./UCI HAR Dataset")
  
## Load activity and feature label files
print("Loading label files...")
activities <- read.table("./activity_labels.txt", col.names = c("activity.id", "activity.name"))
features <- read.table("./features.txt" , col.names = c("position","variable.name"))

## Load test data
print("Loading test data files...")
x.test <- read.table("./test/X_test.txt",header=F)
colnames(x.test) <- features$variable.name
y.test <- read.table("./test/y_test.txt",col.names = c("activity.id"), header=F)
subject.test <- read.table("./test/subject_test.txt",col.names = c("subject.id"), header=F)

## Load training data
print("Loading training data files...")
x.train <- read.table("./train/x_train.txt", header=F)
colnames(x.train) <- features$variable.name
y.train <- read.table("./train/y_train.txt",col.names = c("activity.id"), header=F)
subject.train <- read.table("./train/subject_train.txt",col.names = c("subject.id"), header=F)

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 1. Merge the training and test sets to create a single data set
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

print("Merging test and train data tables...")
## Merge x and y components of the test data
test.data <- cbind(cbind(x.test, subject.test), y.test)

## Merge x and y components of the train data
train.data <- cbind(cbind(x.train, subject.train), y.train)

## Merge both test and train data
merged.data <- rbind(test.data, train.data)

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 2. Extract only the measurements on the mean and standard deviation for each measurement
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

print("Extracting only mean and standard deviation measurements...")
extracted.data <- merged.data[,grepl("mean|std|subject|activity", names(merged.data))]

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 3. Uses descriptive activity names to name the activities in the data set
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

print("Adding descriptive names to activities in the data set...")
labeled.data <- join(extracted.data, activities, by = "activity.id", match = "first")

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 4. Appropriately label the data set with descriptive variable names 
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

print("Renaming variables with more descriptive names...")
colnames(labeled.data) <- gsub('[-()]', '', colnames(labeled.data))
colnames(labeled.data) <- gsub('^t',"TimeDomainSignal.",colnames(labeled.data))
colnames(labeled.data) <- gsub('^f',"FrequencyDomainSignal.",colnames(labeled.data))
colnames(labeled.data) <- gsub('Acc',"Acceleration",colnames(labeled.data))
colnames(labeled.data) <- gsub('GyroJerk',"AngularAcceleration",colnames(labeled.data))
colnames(labeled.data) <- gsub('Gyro',"AngularSpeed",colnames(labeled.data))
colnames(labeled.data) <- gsub('Mag',"Magnitude",colnames(labeled.data))
colnames(labeled.data) <- gsub('mean',".Average",colnames(labeled.data))
colnames(labeled.data) <- gsub('std',".StandardDeviation",colnames(labeled.data))
colnames(labeled.data) <- gsub('Freq.',"Frequency",colnames(labeled.data))
colnames(labeled.data) <- gsub('Freq$',"Frequency",colnames(labeled.data))

## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## 5. Creates a second, independent tidy data set with the average of each variable 
##    for each activity and each subject.
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

print("Creating clean data file...")

# Melting data by subject id and activity name
melted.data <- melt(labeled.data, id.vars = c("subject.id","activity.name"))

# Dcast to apply mean
averaged.data <- dcast(melted.data, subject.id + activity.name ~ variable, mean)

# Order data by subject ID and activity ID
final.data <- arrange(averaged.data, subject.id, activity.id)

# Write tidy dataset to the working folder
write.table(final.data, file = "tidy.txt",sep=",",row.names=F)

# Restore original working directory
setwd("..")

print("Process completed successfully.")
