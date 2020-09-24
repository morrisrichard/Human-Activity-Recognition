# Human-Activity-Recognition
Getting and Cleaning Data Assignment

This file explain the steps in the R script “run_analysis.R” used to organise, extract and tidy data from the “Human Activity Recognition Using Smartphones Dataset” of Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

About the dataset

Experiments were carried out with a group of 30 volunteers ("subjects"). Each subject performed six activities (walking, walking upstairs, walking downstairs, sitting, standing and laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using the smartphone's embedded accelerometer and gyroscope, the researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% for the test data. 

More information about the dataset can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Organisation and tidying of the dataset using the run_analysis.R script

Step 1 creates a folder “UCI_HAR_Dataset”  (if it doesn’t already exist) in the working directory and downloads the data from the original source as a zip file called "data.zip"

Step 2 unzips and loads into R the relevant components of the original data set. These are:
•	features: a dataframe containing a vector with 561 time and frequency domain variables
•	activity_labels: a dataframe listing and assigning a number to the different activities: 1. Walking, 2. Walking upstairs, 3. Walking downstairs, 4. Sitting, 5. Standing, 6. Laying.
•	train_data/test_data: dataframes with the data (i.e. observations) from the train and test datasets, respectively
•	train_subject/test_subject: vectors which assign observations in the train and test datasets to the 30 volunteers (“subjects") in the experiment (there are 21 in the train dataset and 9 in the test dataset) 
•	train_labels/test_labels: vectors which assign the six different activities to the observations in the train and test datasets respectively

Step 3 combines the observations, variable names, activities and subjects into single data frames for each of the train and test datasets called “train_data” and “test_data” and removes redundant files.

Step 4 binds the train and test datasets into a single dataset called “data” and orders this data by subject (i.e. volunteer) and activity. It also removes redundant files.

Step 5 extracts only those variables containing observations relating to the mean and standard deviation of each measurement and stores these in a dataframe called “data_select”.

Step 6 creates a tidy data set, "tidy_data", with the average of each variable for each activity and subject. For clarity, it also adds the activity labels ("walking" ...etc.) to the dataframe. Corrections are also made to variable names where the word “Body” was duplicated in the original data set.
