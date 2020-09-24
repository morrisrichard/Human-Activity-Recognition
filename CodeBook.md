The variables in this dataset are a subset of the data contained in: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

They are derived from accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ, where ‘-XYZ’ is used to denote 3-axial signals in the X, Y and Z directions.

These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 

The acceleration signal was separated into body and gravity acceleration signals:
•	tBodyAcc-XYZ 
•	tGravityAcc-XYZ 
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals:
•	tBodyAccJerk-XYZ 
•	tBodyGyroJerk-XYZ 

The magnitude of these three-dimensional signals were calculated using the Euclidean norm: 
•	tBodyAccMag
•	tGravityAccMag
•	tBodyAccJerkMag
•	tBodyGyroMag
•	tBodyGyroJerkMag 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing:
•	fBodyAcc-XYZ
•	fBodyAccJerk-XYZ
•	fBodyGyro-XYZ
•	fBodyAccJerkMag
•	fBodyGyroMag
•	fBodyGyroJerkMag
Note the 'f' to indicate frequency domain signals. 

The units given are g’s for the accelerometer, rad/sec for the gyro and g/sec and rad/sec/sec for the corresponding jerks.

These signals were used to estimate variables of the feature vector (in the original data set) for each pattern, from which we have extracted just the mean, ‘mean()’, and standard deviation, ‘std()’.  

Altogether there are 33 measurements, for which we have the mean and standard deviation, thus giving 66 variables in total.  

For each of these variables, in "tidy_data" we have computed the mean within each of the six activities (walking, walking upstairs, walking downstairs, sitting, standing and laying) for each of the 30 subjects. In all, this gives 180 observations for each variable.
