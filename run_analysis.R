#### Step 0. download data
#setwd("document/") # set your own working directory
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
              destfile = "Smartphones.zip",method = "curl") 
unzip(zipfile = "Smartphones.zip")

#### Step 1. Merges the training and the test sets to create one data set
# extract training data
dir("UCI HAR Dataset/train/")
train_files <- c("subject_train.txt", "X_train.txt", "y_train.txt")
train_data <- read.table("UCI HAR Dataset/train/subject_train.txt")
for (i in 2:length(train_files)){
  tmp_data <- read.table(paste("UCI HAR Dataset/train/",train_files[i], sep = ""))
  train_data <- cbind(train_data, tmp_data)
}
# extract testing data
dir("UCI HAR Dataset/test/")
test_files <- c("subject_test.txt", "X_test.txt", "y_test.txt")
test_data <- read.table("UCI HAR Dataset/test/subject_test.txt")
for (i in 2:length(test_files)){
  tmp_data <- read.table(paste("UCI HAR Dataset/test/",test_files[i], sep = ""))
  test_data <- cbind(test_data, tmp_data)
}
# merge two data set
whole_data <- rbind(train_data, test_data)

#### Step 2. Extracts only the measurements on the mean and standard deviation for each measurement
mean_measurement <- apply(whole_data[, 2:(ncol(whole_data)-1)], 2, mean)
sd_measurement <- apply(whole_data[, 2:(ncol(whole_data)-1)], 2, sd)

#### Step 3. Uses descriptive activity names to name the activities in the data set
activity_name <- read.table("UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
for(i in 1:nrow(activity_name)){
  tmp_vector <- whole_data[,ncol(whole_data)]
  label_index <- tmp_vector == activity_name[i,"V1"]
  tmp_vector[label_index] <- activity_name[i,"V2"]
  whole_data[,ncol(whole_data)] <- tmp_vector
}

#### Step 4. Appropriately labels the data set with descriptive variable names. 
colnames(whole_data)[1] <- "subject"
measurement_names <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
colnames(whole_data)[2:(ncol(whole_data)-1)] <- measurement_names[,2]
colnames(whole_data)[ncol(whole_data)] <- "activity"

#### Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data <- aggregate(. ~ subject + activity, data = whole_data, mean)
dim(tidy_data)
write.table(tidy_data, "tidy_data.txt", row.name=FALSE) 

