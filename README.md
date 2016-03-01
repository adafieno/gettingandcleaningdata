# Getting and Cleaning Data - Course Project
============================================
Session: February, 2016.
Author: Agustín Da Fieno Delucchi.

## Project Description

The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. .

## Project Requirements

1. A tidy data set 
2. This GitHub repository with the required run_analysis.R script file.
3. A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called *codebook.md*. 
4. This README.md file, which explains how the script works. 

## Required Script
The required R script, called run_analysis.R, does the following:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive activity names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


##Files in this repository

- codebook.md: A file describing the study goals design, process and the data structure.
- README.md: This file
- run_analysis.R: R script that acquires, processes, transforms and cleans up the data.

Steps to create the dataset
1. Clone this repository 
2. Open an R session (RStudio is highly recommended) 
3. Set the working folder of the session to your local version of the repository (cloned in 1)
5. Source run_analisys.R script source('run_analysis.R') 

The resulting clean (tidy) data file is called tidy.csv.




