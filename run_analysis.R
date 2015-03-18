run_analysis <- function() {
  ## Course ID:getdata-012
  ## login id: uy7302@att.com
  ## submission password: XASuQa3V5x
  ##
  ## Instructor Notes:
  ## You should create one R script called run_analysis.R that does the following. 
  ## 1.Merges the training and the test sets to create one data set.
  ## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
  ## 3.Uses descriptive activity names to name the activities in the data set
  ## 4.Appropriately labels the data set with descriptive variable names. 
  ## 5.From the data set in step 4, creates a second, independent tidy data set with the 
  ## average of each variable for each activity and each subject.
  ##
 
  ## Load libraries used
  library(data.table)
  library(plyr)
  library(dplyr)
  library(DataCombine)
  ##
  ## Point to files
  setwd("C:/Users/uy7302/Documents/GitHub/March/Getting & Cleaning Data/Course_Project/UCI HAR Dataset")
  data1 <- "~/GitHub/March/Getting & Cleaning Data/Course_Project/UCI HAR Dataset/features.txt"
  data2 <- "~/GitHub/March/Getting & Cleaning Data/Course_Project/UCI HAR Dataset/train/y_train.txt"
  data3 <- "~/GitHub/March/Getting & Cleaning Data/Course_Project/UCI HAR Dataset/train/subject_train.txt"
  data4 <- "~/GitHub/March/Getting & Cleaning Data/Course_Project/UCI HAR Dataset/test/y_test.txt"
  data5 <- "~/GitHub/March/Getting & Cleaning Data/Course_Project/UCI HAR Dataset/test/subject_test.txt"
  data6 <- "~/GitHub/March/Getting & Cleaning Data/Course_Project/UCI HAR Dataset/train/X_train.txt"
  data7 <- "~/GitHub/March/Getting & Cleaning Data/Course_Project/UCI HAR Dataset/test/X_test.txt"
  ##
  ## Load feature variables as a data frame & rename the variable names of the table
  featvardf <- tbl_df(fread(data1,header=FALSE))%>%
    rename(Index = V1, FeatureVariableNames = V2)
  ##
  ## Create a character vector for a total of 561 features variable names
  varnamelist <- select(featvardf,FeatureVariableNames)
  varnames <- as.character(unlist(varnamelist))
  varnames2 <- c("subjectlabel","activitylabel",varnames)
  ##
  ##Load activity label & subject data for training & testing datasets
  actlbltrndf <- tbl_df(read.table(data2,header=FALSE))
  sbjlbltrndf <- tbl_df(read.table(data3,header=FALSE))
  actlbltstdf <- tbl_df(read.table(data4,header=FALSE))
  sbjlbltstdf <- tbl_df(read.table(data5,header=FALSE))
  ##
  ## cbind activity lables & subject labels to training & testing sets
  trndf <- tbl_df(read.table(data6,header=FALSE))
  trndf1 <- tbl_df(cbind(sbjlbltrndf,actlbltrndf,trndf))
  tstdf <- tbl_df(read.table(data7,header=FALSE))
  tstdf1 <- tbl_df(cbind(sbjlbltstdf,actlbltstdf,tstdf))
  ##
  ## rbind the training and testing sets & assign header names
  merged_data <- tbl_df(rbind(trndf1,tstdf1))%>%
    setnames(varnames2)
  ##
  ## Remove duplicates since "dplyr" package "select" function throws an error with duplicates
  ## select only the columns containing "mean" & "std"
  removedups<-merged_data[,!duplicated(colnames(merged_data))]%>%
    select(subjectlabel,activitylabel,contains("mean"),contains("std"))
  ##
  ## Use descriptive names to name the activities in the dataset
  removedups$activitylabel[removedups$activitylabel==1] <- "WALKING"
  removedups$activitylabel[removedups$activitylabel==2] <- "WALKING_UPSTAIRS"
  removedups$activitylabel[removedups$activitylabel==3] <- "WALKING_DOWNSTAIRS"
  removedups$activitylabel[removedups$activitylabel==4] <- "SITTING"
  removedups$activitylabel[removedups$activitylabel==5] <- "STANDING"
  removedups$activitylabel[removedups$activitylabel==6] <- "LAYING"
  ##
  ##
  ## Tidy up the variable names
  removedups <- tolower(colnames(removedups))%>%
    gsub("[a][A][c][C][c][C]","acceleration")%>%
    gsub("[s][S][t][T][d][D]","stdeviation")%>%
    gsub("-[x][X]","xaxis")%>%
    gsub("-[y][Y]","yaxis")%>%
    gsub("-[z][Z]","zaxis")%>%
    gsub("\\(","")%>%
    gsub("\\)","")%>%
    gsub("-","")%>%
    gsub("\\,","")
  ##
  ## View output
  View(removedups)
  #View(tstdf1)
  #View(trndf1)
}