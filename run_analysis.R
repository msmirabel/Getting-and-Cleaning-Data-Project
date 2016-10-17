
  # 1. Merges the training and the test sets to create one data set.

  x_train <- read.table("train/X_train.txt")
  y_train <- read.table("train/y_train.txt")
  subject_train <- read.table("train/subject_train.txt")
  
  x_test <- read.table("test/X_test.txt")
  y_test <- read.table("test/y_test.txt")
  subject_test <- read.table("test/subject_test.txt")
  
  # merge x train and test
  x <- rbind(x_train, x_test)
  
  # merge y train and test
  y <- rbind(y_train, y_test)
  
  # merge subject train and test 
  subject <- rbind(subject_train, subject_test)
  
  library(dplyr)


  # 2. Extracts only the measurements on the mean and standard deviation for each measurement.
  
  features <- read.table("features.txt")

  # get the names mean() or std() measurements
  meanstd <- grep("mean\\(\\)|std\\(\\)", features[, 2])
  
  # get x with the mean and std measurements 
  x <- x[, meanstd]
  
  # add the column names based on the measurements 
  names(x) <- features[meanstd, 2]
  

  # 3. Uses descriptive activity names to name the activities in the data set
  
  activities <- read.table("activity_labels.txt")
  
  # update y data set with correct activity names
  y[, 1] <- activities[y[, 1], 2]
  colnames(y) <- "activities"
  
  #4.  Appropriately labels the data set with descriptive variable names.

  # update subject_data as subjects
  colnames(subject) <- "subjects"
  
  # now that all the data sets have correct col names, merge all of them. 
  
  mergeall <- cbind(x, y, subject)

  # 5. From the data set in step 4, creates a second, independent 
  # tidy data set with the average of each variable for each activity and each subject.
  
  group<-aggregate(. ~subjects + activities, mergeall, mean, na.rm=TRUE)
  
  tidydata<-group[order(group$subjects, group$activities),]

  write.table(tidydata, "tidydata.txt", row.name=FALSE)
