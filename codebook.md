The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

# Description of the Code
1. The code combines rows of x_train with x_test, y_train with y_test, subject_train with subject_test which are downloaded from the datasets. 
So it creates 3 data sets(x, y, subject). 

2. features data includes column names used for x data and by using grep, it filters column names including mean or std. And x gets the column names
with mean or std measurement. 

3. activity_labels include activity names used for y data, and for the activities that match the values in y, it assigns the activity name. 
And the column name is activities. 

4. subject data includes subjects doing the tests. And it updates the column name in subject data to subjects. 
It column binds the 3 data sets(x,y, subject) into mergeall. 

5. by using aggregate, it splits mergeall data and generates tidy data with the average of each variable for each activity and each subject.
