The code can implement creating tidy data set with the average of each variable for each activity and each subject from the data set collected from the accelerometers from the Samsung Galaxy S smartphone.

A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

What I did is by the following steps:
  1. Merges the training and the test sets to create one data set.
  2. Extracts only the measurements on the mean and standard deviation for each measurement. 
  3. Uses descriptive activity names to name the activities in the data set
  4. Appropriately labels the data set with descriptive variable names. 
  5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

In this tidy data, the description of variables are as follows (refer to the website of raw data set):
  1. subject: subjects of this experiment. There are 30 volunteers in the experiment.
  2. activity: activities of six activities wearing a smartphone (Samsung Galaxy S II) on the waist, including "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING".
  3. from 3rd variable to 479th variable: 
