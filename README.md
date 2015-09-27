# getandcleandataproject

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

###How the script works:
1. download the data from [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#)
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
