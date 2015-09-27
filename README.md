# getandcleandataproject
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
