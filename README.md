# GetData-Course-Project
Coursera Course ID: getdata-012

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example  this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

 You should create one R script called run_analysis.R that does the following. 
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement. 
3.Uses descriptive activity names to name the activities in the data set
4.Appropriately labels the data set with descriptive variable names. 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## run_analysis.R, uy7302, Fri Mar 20 19:53:59 2015
##### 1.  Load libraries used
##### 2.  Point to files. Data files used & the data contained therein explained below:
*features.txt: ALL feature variable names to be the header of the dataset. A total of 561 feature variables were initial provided.

*y_train.txt: Activity labels for the training dataset in the order of how the experiment was performed such as standing -> sitting -> laying -> walking etc. 

*subject_train.txt: Subject labels for the training dataset in the order of how the experiment was performed such as Mr. John Doe would be subject # 1. A total of 30 subjects (people) were used for this experiment

*X_train.txt: Training data for the 561 implied variables

*y_test.txt: Activity labels for the test dataset in the order of how the experiment was performed such as standing -> sitting -> laying -> walking etc. 

*subject_test.txt: Subject labels for the training dataset in the order of how the experiment was performed such as Mr. John Doe would be subject # 1. A total of 30 subjects (people) were used for this experiment

*X_test.txt:Testing data for the 561 implied variables

##### 3.  Load feature variables as a data table & rename the variable names of the table
##### 4.  Create a character vector for a total of 561 features variable names
##### 5.  Load activity label & subject data for training & testing datasets
##### 6.  "cbind" activity lables & subject labels to training & testing sets
##### 7.  "rbind" the training and testing sets & assign header names
##### 8.  Remove duplicates since "dplyr" package "select" function throws an error with duplicates
##### 9.  Select only the columns containing "mean" & "std"
##### 10. Use descriptive names for the activities in the dataset e.g. WALING, SITTING.... etc.
##### 11. Tidy the variable names
##### 12. Remove all special characters,try to be as descriptive as possible & convert to lowercase
##### 13. Also, try using universally accepted abbreviations where variable names becomes too large
##### 14. Assign the new cleaned variables to the merged data
##### 15. From the data set above, create a second independent tidy data set with the average of each variable
##### 16. This dataset needs to be grouped by "activitylabel" & "subjectid"
##### 17. Write the output to a text file.
