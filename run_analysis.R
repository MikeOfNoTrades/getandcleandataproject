#setwd("~/work/data/get_and_clean/project")
library(dplyr)
library(tidyr)

# read files
subject_test <-read.table("UCI HAR Dataset/test/subject_test.txt", colClasses="factor")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", colClasses="factor")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", colClasses="factor")
x_train <- read.table("UCI HAR Dataset/train//X_train.txt")
y_train <- read.table("UCI HAR Dataset/train//y_train.txt", colClasses="factor")
reading_labels <- read.table("UCI HAR Dataset/features.txt", colClasses=c("factor", "factor"), stringsAsFactors = TRUE)

# 1. Merge test and train data

subject <- bind_rows(subject_test, subject_train)
activity <- bind_rows(y_test, y_train)
readings <- bind_rows(x_test, x_train)


# 4. Appropriately label the data set with descriptive variable names.
# name variables
# name columns in data sets
colnames(subject) <- "subject"
colnames(activity) <- "activity"
labels <- as.factor(reading_labels[,2])
names(readings) <- labels

# 1. merge datasets
merged_data <- bind_cols(subject, activity, readings)

# 3. Use descriptive activity names to name the activities in the data set
#    WALKING, 
#    WALKING_UPSTAIRS, 
#    WALKING_DOWNSTAIRS, 
#    SITTING, 
#    STANDING, 
#    LAYING 

levels(merged_data$activity) <- c("walking", "walking-upstairs", "walking_downstairs", "sitting", "standing", "laying")

# 2. Extract only the measurements on the mean and standard deviation for each measurement.
tidy_data <- merged_data[ , grepl( 'subject' , names( merged_data ), fixed = TRUE )
                         | grepl( 'activity' , names( merged_data ), fixed = TRUE )
                         | grepl( 'mean()' , names( merged_data ), fixed = TRUE ) 
                         | grepl( 'std()' , names( merged_data ), fixed = TRUE ) ]

extracted_data <- merged_data[ , grepl( 'mean()' , names( merged_data ), fixed = TRUE ) 
                              | grepl( 'std()' , names( merged_data ), fixed = TRUE ) ]
# 5. From the data set in step 4, create a second, independent tidy data set
#    with the average of each variable for each activity and each subject. 
#    rename variables

tidy_groups <- group_by(tidy_data, subject, activity)
tidy_averages <- summarise_each(tidy_groups, funs(mean))
tidy_averages <- arrange(tidy_averages, as.numeric(subject))


