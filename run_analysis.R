# You should create one R script called run_analysis.R that does the following. 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each
# measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set
#with the average of each variable for each activity and each subject.

library(plyr)

# 1.

# First, the training data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Second, the test data
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Create 'x' data set
x_data <- rbind(x_train, x_test)

# Create 'y' data set
y_data <- rbind(y_train, y_test)

# Create 'subject' data set
subject_data <- rbind(subject_train, subject_test)

# 2.

feat = read.table("UCI HAR Dataset/features.txt")

# We extract the mean and standard deviation of the features 
mean_std_feat = grep("-(mean|std)\\(\\)", feat[,2])

# We add this to the x_data set
x_data <- x_data[, mean_std_feat]

# We change the name within the x_data set
names(x_data) <- feat[mean_std_feat, 2]

# 3.

activities <- read.table("UCI HAR Dataset/activity_labels.txt")

# update values with correct activity names
y_data[, 1] <- activities[y_data[, 1], 2]

# correct column name
names(y_data) <- "activity"

# 4.

names(subject_data) <- "subject"

# We finally bind all the data into one data set
all_data <- cbind(x_data, y_data, subject_data)

# 5.

avg_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(avg_data, "avg_data.txt", row.name=FALSE)
