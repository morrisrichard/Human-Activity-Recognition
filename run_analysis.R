
# 1. Create a folder and download the data from the original source
if (!file.exists("UCI_HAR_Dataset")) {dir.create("UCI_HAR_Dataset")}
url <- "https://getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "./UCI_HAR_Dataset/data.zip")

# 2. Unzip and load into R the relevant components of the original dataset
features <- read.table(unz("./UCI_HAR_Dataset/data.zip", "UCI HAR Dataset/features.txt"), header=F)
activity_labels <- read.table(unz("./UCI_HAR_Dataset/data.zip", "UCI HAR Dataset/activity_labels.txt"), header=F)
train_data <- read.table(unz("./UCI_HAR_Dataset/data.zip", "UCI HAR Dataset/train/X_train.txt"), header=F)
test_data <- read.table(unz("./UCI_HAR_Dataset/data.zip", "UCI HAR Dataset/test/X_test.txt"), header=F)
train_subject <- read.table(unz("./UCI_HAR_Dataset/data.zip", "UCI HAR Dataset/train/subject_train.txt"), header=F)
test_subject <- read.table(unz("./UCI_HAR_Dataset/data.zip", "UCI HAR Dataset/test/subject_test.txt"), header=F)
train_labels <- read.table(unz("./UCI_HAR_Dataset/data.zip", "UCI HAR Dataset/train/y_train.txt"), header=F)
test_labels <- read.table(unz("./UCI_HAR_Dataset/data.zip", "UCI HAR Dataset/test/y_test.txt"), header=F)

# 3. Combine the observations, descriptive variable names, activities and subjects into single dataframes
train_data <- data.frame(train_subject, train_labels, train_data)
colnames(train_data) <- c("subject", "activity", features[,2])
remove(train_subject, train_labels)
test_data <- data.frame(test_subject, test_labels, test_data)
colnames(test_data) <- c("subject", "activity", features[,2])
remove(test_subject, test_labels)

# 4. Bind together the train and test datasets and order by subject then activity
data <- rbind(train_data, test_data)
data <-data[order(data$subject, data$activity),]
remove(train_data, test_data)

# 5. Extract only the mean and standard deviation for each measurement
data_select <- data[, which(colnames(data) %in% c("subject", "activity", 
                                                  grep("std()|mean+[^Freq]+()", colnames(data), value=TRUE)))]

# 6. Creates a tidy data set with the average of each variable for each activity and subject
# also includes the names of the activities ("walking" ...etc) in the dataframe
# and correct an error (repetition) in one of the variable names in the original data set
tidy_data <- aggregate(. ~ subject + activity, data_select, mean)
names(tidy_data) <-gsub("BodyBody", "Body", names(tidy_data))
colnames(activity_labels) <- c("activity", "activity_label")
tidy_data <- merge(activity_labels, tidy_data, by = "activity")


