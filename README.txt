Date modified	Commment
02/11//2020	First edition

The dataset includes the following files:
=========================================
- README.txt: explanations of data the data set

- Code_Book.txt : file countaining the data set variables

- Getting_And_Cleaning_Data_Assignment.R : script used to extract data 

Analysis done on the data in the scrit Getting_And_Cleaning_Data_Assignment.R:
=========================================

Step 1: Combine test and train data
- Data downloaded from : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
- The folder is unzipped 
- The script combines the data set called ""X_test.txt" with the suject number in "subject_test.txt" and with the activity number in "y_test.txt". The variable names are found in "features.txt"
- The previous step is repeated with the data from the "train" data sets.
- The script combines the two data sets "test" and "train"

Step 2: Extract the mean and std data
- Only the variables corresponding to a mean or a standard deviation measurement are extracted from the new data set together with the activity label and the subject id

Step 3: Replace the activity label (number) by a descriptive name.
- The correspondance between number and name is found in the file "activity_labels.txt"
- The data set is ordered by activity number and these numbers are replaced with descriptive names

Step 4: Rename the variables
- "()" and "-" are removed from variable names

Step 5: Extract mean measurement for each subject and each activity
- The data set is grouped by activity and subject
- the mean is calculated for each measurement
- The final data set is created countaining the mean for each subject (1 to 30) and each activity (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

