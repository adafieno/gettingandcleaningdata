Code Book for Getting and Cleaning Data Project
===============================================

### Goals

The goal of the study is to collect, process and clean the Human Activity Recognition Using Smartphones Data Set for further processing and analysis.

### Data Source

The data used for this project can be found at URL: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. 

The data is part of the Human Activity Recognition Using Smartphones Data Set study. A full description of the study and  data can be found here URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The following files were used for the study:
* features.txt: List of all the features in the study. 
* activity_labels.txt: Name of the different activities in the experiment. 
* train/X_train.txt: Training dataset.
* train/y_train.txt: Training data labels. 
* train/subject_train.txt: Identifies the subjects involved in the different activities for each sample, for data training purposes.Range: 1 to 30. 
* test/x_test.txt: Test dataset. 
* test/y_test.txt: Test dataset labels. 
* test/subject_test.txt: Identifies the subjects involved in the different activities for each sample, for data testing purposes. Range: 1 to 30.

### Dependencies (R Libraries)
The following R libraries were used for the study:
* plyr
* dplyr
* reshape2

### Design
The following describe the steps followed to creatre the script run_analysis.R to process and clean the data:

1. Download and unpack the data source
2. Acquire and build the training dataset from its different components: activities, subjects and variables.
3. Acquire and build the testing dataset from its different components: activities, subjects and variables. 
4. Join training and test data into a single data frame. 
5. Name all features measured/calculated using the feature names provided. 
6. Extract only features containing mean or standard deviation. 
7. Make the feature names more clearly understood. 
8. Use descriptive names for each activity, in addition to the activity id.
9. Merge, aggregate and re-arrange the data by subject and activity, and apply the mean to all variables. 
10. Order the data by subject and activity id.


### Cleaned Data Structure

The cleaned output file is called tidy.txt. It's a comma separate file.

## subject.id
Identifier for each subject who carried out the experiment. Range (integer) 1:30
 
## activity.name
Activity performed by subjects during the experiment. Levels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.


The following describe the different components which combination makes up the different variables in the study:

## Domain 
Domain of the signal measured. Levels:
TimeDomainSignal, FrequencyencyDomainSignal

## Signal 
Signals measured. Levels:
BodyAcceleration, BodyAccelerationMagnitude, BodyAccelerationJerk, BodyAccelerationJerkMagnitude, BodyAngularSpeed,BodyAngularSpeedMagnitude,BodyAngularSpeedJerk, BodyAngularSpeedJerkMagnitude,GravityAcceleration, GravityAccelerationMagnitude

## Axis 
Spatial axis of the signal measured. Levels: X, Y, Z. 

## Average
Average(mean) of all measured means for each subject, activity, domain, signal and axis. Range (float): ­1.0:1.0  

## StandardDeviation 
Average(mean) of all measured standard deviations for each subject, activity, domain, signal and axis. Range (float):­1.0:1.0 

* The units used for the accelerations (total and body) are 'g's (gravity of earth -> 9.80665 m/seg2).
* The gyroscope (angular speed) units are rad/seg.

## List of variables: 
TimeDomainSignal.BodyAcceleration.AverageX, TimeDomainSignal.BodyAcceleration.AverageY, TimeDomainSignal.BodyAcceleration.AverageZ, TimeDomainSignal.BodyAcceleration.StandardDeviationX, TimeDomainSignal.BodyAcceleration.StandardDeviationY, TimeDomainSignal.BodyAcceleration.StandardDeviationZ, TimeDomainSignal.GravityAcceleration.AverageX, TimeDomainSignal.GravityAcceleration.AverageY, TimeDomainSignal.GravityAcceleration.AverageZ, TimeDomainSignal.GravityAcceleration.StandardDeviationX, TimeDomainSignal.GravityAcceleration.StandardDeviationY, TimeDomainSignal.GravityAcceleration.StandardDeviationZ, TimeDomainSignal.BodyAccelerationJerk.AverageX, TimeDomainSignal.BodyAccelerationJerk.AverageY, TimeDomainSignal.BodyAccelerationJerk.AverageZ, TimeDomainSignal.BodyAccelerationJerk.StandardDeviationX, TimeDomainSignal.BodyAccelerationJerk.StandardDeviationY, TimeDomainSignal.BodyAccelerationJerk.StandardDeviationZ, TimeDomainSignal.BodyAngularSpeed.AverageX, TimeDomainSignal.BodyAngularSpeed.AverageY, TimeDomainSignal.BodyAngularSpeed.AverageZ, TimeDomainSignal.BodyAngularSpeed.StandardDeviationX, TimeDomainSignal.BodyAngularSpeed.StandardDeviationY, TimeDomainSignal.BodyAngularSpeed.StandardDeviationZ, TimeDomainSignal.BodyAngularAcceleration.AverageX, TimeDomainSignal.BodyAngularAcceleration.AverageY, TimeDomainSignal.BodyAngularAcceleration.AverageZ, TimeDomainSignal.BodyAngularAcceleration.StandardDeviationX, TimeDomainSignal.BodyAngularAcceleration.StandardDeviationY, TimeDomainSignal.BodyAngularAcceleration.StandardDeviationZ, TimeDomainSignal.BodyAccelerationMagnitude.Average, TimeDomainSignal.BodyAccelerationMagnitude.StandardDeviation, TimeDomainSignal.GravityAccelerationMagnitude.Average, TimeDomainSignal.GravityAccelerationMagnitude.StandardDeviation, TimeDomainSignal.BodyAccelerationJerkMagnitude.Average, TimeDomainSignal.BodyAccelerationJerkMagnitude.StandardDeviation, TimeDomainSignal.BodyAngularSpeedMagnitude.Average, TimeDomainSignal.BodyAngularSpeedMagnitude.StandardDeviation, TimeDomainSignal.BodyAngularAccelerationMagnitude.Average, TimeDomainSignal.BodyAngularAccelerationMagnitude.StandardDeviation, FrequencyencyDomainSignal.BodyAcceleration.AverageX, FrequencyencyDomainSignal.BodyAcceleration.AverageY, FrequencyencyDomainSignal.BodyAcceleration.AverageZ, FrequencyencyDomainSignal.BodyAcceleration.StandardDeviationX, FrequencyencyDomainSignal.BodyAcceleration.StandardDeviationY, FrequencyencyDomainSignal.BodyAcceleration.StandardDeviationZ, FrequencyencyDomainSignal.BodyAcceleration.AverageFrequency, FrequencyencyDomainSignal.BodyAccelerationJerk.AverageX, FrequencyencyDomainSignal.BodyAccelerationJerk.AverageY, FrequencyencyDomainSignal.BodyAccelerationJerk.AverageZ, FrequencyencyDomainSignal.BodyAccelerationJerk.StandardDeviationX, FrequencyencyDomainSignal.BodyAccelerationJerk.StandardDeviationY, FrequencyencyDomainSignal.BodyAccelerationJerk.StandardDeviationZ, FrequencyencyDomainSignal.BodyAccelerationJerk.AverageFrequency, FrequencyencyDomainSignal.BodyAngularSpeed.AverageX, FrequencyencyDomainSignal.BodyAngularSpeed.AverageY, FrequencyencyDomainSignal.BodyAngularSpeed.AverageZ, FrequencyencyDomainSignal.BodyAngularSpeed.StandardDeviationX, FrequencyencyDomainSignal.BodyAngularSpeed.StandardDeviationY, FrequencyencyDomainSignal.BodyAngularSpeed.StandardDeviationZ, FrequencyencyDomainSignal.BodyAngularSpeed.AverageFrequency, FrequencyencyDomainSignal.BodyAccelerationMagnitude.Average, FrequencyencyDomainSignal.BodyAccelerationMagnitude.StandardDeviation, FrequencyencyDomainSignal.BodyAccelerationMagnitude.AverageFrequency, FrequencyencyDomainSignal.BodyBodyAccelerationJerkMagnitude.Average, FrequencyencyDomainSignal.BodyBodyAccelerationJerkMagnitude.StandardDeviation, FrequencyencyDomainSignal.BodyBodyAccelerationJerkMagnitude.AverageFrequency, FrequencyencyDomainSignal.BodyBodyAngularSpeedMagnitude.Average, FrequencyencyDomainSignal.BodyBodyAngularSpeedMagnitude.StandardDeviation, FrequencyencyDomainSignal.BodyBodyAngularSpeedMagnitude.AverageFrequency, FrequencyencyDomainSignal.BodyBodyAngularAccelerationMagnitude.Average, FrequencyencyDomainSignal.BodyBodyAngularAccelerationMagnitude.StandardDeviation, FrequencyencyDomainSignal.BodyBodyAngularAccelerationMagnitude.AverageFrequency


### References
1. Human Activity Recognition Using Smartphones Data Set. URL: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones.
2. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
3. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.
   *A Public Domain Dataset for Human Activity Recognition Using Smartphones*.
   ESANN 2013 proceedings, European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning. Bruges (Belgium), 24-26 April 2013
4. Activity recognition. URL: <http://en.wikipedia.org/wiki/Activity_recognition>.
5. Jerk. URL: <http://en.wikipedia.org/wiki/Jerk_(physics)>.
6. Magnitude. URL: <http://en.wikipedia.org/wiki/Magnitude_(mathematics)>
7. Time domain. URL: <http://en.wikipedia.org/wiki/Time-domain>.



