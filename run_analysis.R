## This scripts answer the assignment from Getting and Cleaning Data Week 4 
## assignement

## ----------- This part of the code is the answer to point #1 -------------

## Find variable names
setwd("UCI HAR Dataset")
Var <- read.table("features.txt")

## Read data, the activity label and the subject id and combine them in a single 
## data set. Do this for both train and test results
setwd("test")
DT_test_X <- read.table("X_test.txt")
DT_test_y <- read.table("y_test.txt")
Subj_test <- read.table("subject_test.txt")
DT_test_X <- cbind(DT_test_X, DT_test_y, Subj_test)
names(DT_test_X) <- c(Var[,2], "activitylabel", "subject")

setwd("..")
setwd("train")
DT_train_X <- read.table("X_train.txt")
DT_train_y <- read.table("y_train.txt")
Subj_train <- read.table("subject_train.txt")
DT_train_X <- cbind(DT_train_X, DT_train_y, Subj_train)
names(DT_train_X) <- c(Var[,2], "activitylabel", "subject")

## Combine the two data sets together
DT_X <- rbind(DT_test_X,DT_train_X)

## ----------- This part of the code is the answer to point #2 -------------

## Finding which names in the data set correspond to a mean or a standard variation
library(dplyr)
Meas <- grep("mean|std" , names(DT_X), value = TRUE)

##Create a subset data frame with only these measurements
DT_new <- select(DT_X, Meas[1 : length(Meas)] , activitylabel, subject)

## ----------- This part of the code is the answer to point #3 -------------

## Find the activity names in activity_labels.txt file and replace the name in the data set
setwd("..")
Var2 <- read.table("activity_labels.txt")

## Sort Data frame by activity name
DT_new <- arrange(DT_new,DT_new$activitylabel)

## Build a vector corresponding to the activitylabel in the data set
New_ActLabl <- vector()
for (i in seq_along(Var2[,1])){
  n_count <- sum(DT_new$activitylabel == Var2[i,1])
  New_ActLabl <- c(New_ActLabl, rep(Var2[i,2], times = n_count))
}

## Replace the activity number by the new created vector with descriptive names
DT_new <- mutate(DT_new, activitylabel = New_ActLabl)

## ----------- This part of the code is the answer to point #4 -------------

## Remove parenthesis 
names(DT_new) <- sub("\\(\\)", "", names(DT_new))
## Remove "-"
names(DT_new) <- gsub("-", "", names(DT_new))


## ----------- This part of the code is the answer to point #5 -------------

## Grouping data by activity and subject then summarizing across all columns
DT_final <- DT_new %>% group_by(activitylabel,subject) %>% 
  summarise(across(tBodyAccmeanX:fBodyBodyGyroJerkMagmeanFreq, mean, na.rm= TRUE))