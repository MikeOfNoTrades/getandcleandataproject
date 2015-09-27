---
title: "Codebook for Project"
author: "Mike"
date: "September 27, 2015"
output:
  html_document:
    keep_md: yes
---

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
1. download the data
2. unizip the data
3. Make sure data is in your working directory
4. Load libraries: 
  <br />    dplyr
  <br />    tidyr
5. Using read.table, read each of the following files into variables
  <br />subject_test:   "UCI HAR Dataset/test/subject_test.txt"
  <br />subject_train:  "UCI HAR Dataset/train/subject_train.txt"
  <br />x_test:         "UCI HAR Dataset/test/X_test.txt"
  <br />y_test:         "UCI HAR Dataset/test/y_test.txt"
  <br />x_train:        "UCI HAR Dataset/train//X_train.txt"
  <br />y_train:        "UCI HAR Dataset/train//y_train.txt"   
  <br />reading_labels: "UCI HAR Dataset/features.txt"
6. Using bind -rows(), Merge test and train data
  <br />subject:  subject_test, subject_train
  <br />activity: y_test, y_train
  <br />readings: x_test, x_train
7. Name the first two columns "subject" and "activity", respectively
8. Using bind_columns, merge the three datasets: subject, activity, readings
9. Rename the activites: "walking", "walking-upstairs", "walking_downstairs", "sitting", "standing", "laying"
10. Using grepl(), extract only the measurements on the mean and standard deviation for each measurement
11. Group by subject and activity
12. Use summarise_each() to get the means of subjects abd activities
13. arrange according to subject

###Cleaning of the data
The script reads the data files and merges them into three sets of data: subjects, activities and readings.
<br />It then renames the first two columns into subject and activity. 
<br />It then merges the three sets of data into a single data set, where the first column is subject, the second activity, and the rest are the various readings taken duirng the study
<br />It then renames the activities with desxriptive nouns rather than numbers.
<br />The it xxtracts only the measurements on the mean and standard deviation for each reading.
<br />The data is the grouped according to subject and activity, and the means of each grouping are extracted

<br />[link to the readme document that describes the code in greater detail]()

##Description of the variables in the tiny_data.txt file
 - Dimensions of the dataset: 180 rows x 68 columns
 - The first column is the subject, represented by an intger.
 - The secong column is a description of the activity
 - The remaining columns are the means of the measurements of eachg activity for each subject
 ###Variables present in the dataset:
 - 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

###Variable 1 (repeat this section for all variables in the dataset)
Short description of what the variable describes.

Some information on the variable including:
 - Class of the variable
 - Unique values/levels of the variable
 - Unit of measurement (if no unit of measurement list this as well)
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 

(you can easily use Rcode for this, just load the dataset and provide the information directly form the tidy data file)

####Notes on variable 1:
If available, some additional notes on the variable not covered elsewehere. If no notes are present leave this section out.

##Sources
Sources you used if any, otherise leave out.

##Annex
If you used any code in the codebook that had the echo=FALSE attribute post this here (make sure you set the results parameter to 'hide' as you do not want the results to show again)
