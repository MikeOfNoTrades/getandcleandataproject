---
title: "Codebook for Project"
author: "Mike"
date: "September 27, 2015"
output:
  html_document:
    keep_md: yes
---
#Codebook
## Project Description
This is my project for the course: Getting and Cleaning Data<br />
The project involves creating a tidy data set from the following research project:<br />

__Human Activity Recognition Using Smartphones Data Set__ <br />
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones<br />
It uses data from this dataset:<br />
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip<br />

##Study design and data processing
Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
###Collection of the raw data
__According to the website:__<br />
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


##Creating the tidy datafile

###Guide to create the tidy data file
<br />[README](README.md)

###Cleaning of the data
The script reads the data files and merges them into three sets of data: subjects, activities and readings.
<br />It then renames the first two columns into subject and activity. 
<br />It then merges the three sets of data into a single data set, where the first column is subject, the second activity, and the rest are the various readings taken duirng the study
<br />It then renames the activities with desxriptive nouns rather than numbers.
<br />The it extracts only the measurements on the mean and standard deviation for each reading.
<br />The data is the grouped according to subject and activity, and the means of each grouping are extracted

##Description of the variables in the tiny_data.txt file
 - Dimensions of the dataset: 180 rows x 68 columns
 - The first column is the subject, represented by an intger.
 - The second column is a description of the activity
 - The remaining columns are the means of the measurements of each activity for each subject
 
###Variables present in the dataset:
#####subject
Describes the subject of the observation<br />
Class: character, representing an integer<br />
#####activity
Describes the activity observed<br />
Class: factor<br />
####Measurement variables
  Each of the following varaibles represent various components of:<br />
  ======================================<br />
  - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.<br />
  - Triaxial Angular velocity from the gyroscope. <br />
  - A 561-feature vector with time and frequency domain variables. <br />
  - Its activity label. <br />
  - An identifier of the subject who carried out the experiment.<br />
  ======================================<br />
Class: numeric, floating point<br />

#####tBodyAcc-mean()-X
#####tBodyAcc-mean()-Y
#####tBodyAcc-mean()-Z
#####tBodyAcc-std()-X
#####tBodyAcc-std()-Y
#####tBodyAcc-std()-Z
#####tGravityAcc-mean()-X
#####tGravityAcc-mean()-Y
#####tGravityAcc-mean()-Z
#####tGravityAcc-std()-X
#####tGravityAcc-std()-Y
#####tGravityAcc-std()-Z
#####tBodyAccJerk-mean()-X
#####tBodyAccJerk-mean()-Y
#####tBodyAccJerk-mean()-Z
#####tBodyAccJerk-std()-X
#####tBodyAccJerk-std()-Y
#####tBodyAccJerk-std()-Z
#####tBodyGyro-mean()-X
#####tBodyGyro-mean()-Y
#####tBodyGyro-mean()-Z
#####tBodyGyro-std()-X
#####tBodyGyro-std()-Y
#####tBodyGyro-std()-Z
#####tBodyGyroJerk-mean()-X
#####tBodyGyroJerk-mean()-Y
#####tBodyGyroJerk-mean()-Z
#####tBodyGyroJerk-std()-X
#####tBodyGyroJerk-std()-Y
#####tBodyGyroJerk-std()-Z
#####tBodyAccMag-mean()
#####tBodyAccMag-std()
#####tGravityAccMag-mean()
#####tGravityAccMag-std()
#####tBodyAccJerkMag-mean()
#####tBodyAccJerkMag-std()
#####tBodyGyroMag-mean()
#####tBodyGyroMag-std()
#####tBodyGyroJerkMag-mean()
#####tBodyGyroJerkMag-std()
#####fBodyAcc-mean()-X
#####fBodyAcc-mean()-Y
#####fBodyAcc-mean()-Z
#####fBodyAcc-std()-X
#####fBodyAcc-std()-Y
#####fBodyAcc-std()-Z
#####fBodyAccJerk-mean()-X
#####fBodyAccJerk-mean()-Y
#####fBodyAccJerk-mean()-Z
#####fBodyAccJerk-std()-X
#####fBodyAccJerk-std()-Y
#####fBodyAccJerk-std()-Z
#####fBodyGyro-mean()-X
#####fBodyGyro-mean()-Y
#####fBodyGyro-mean()-Z
#####fBodyGyro-std()-X
#####fBodyGyro-std()-Y
#####fBodyGyro-std()-Z
#####fBodyAccMag-mean()
#####fBodyAccMag-std()
#####fBodyBodyAccJerkMag-mean()
#####fBodyBodyAccJerkMag-std()
#####fBodyBodyGyroMag-mean()
#####fBodyBodyGyroMag-std()
#####fBodyBodyGyroJerkMag-mean()
#####fBodyBodyGyroJerkMag-std()


(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

##Sources
[]()
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)
