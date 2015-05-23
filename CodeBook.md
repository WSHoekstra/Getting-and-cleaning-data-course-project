---
title: "Coursera Getting and Cleaning Data course project"
author: "WS Hoekstra"
date: "Saturday, May 23, 2015"
output: html_document
---


### Source of the data
This analysis was done as part of a Coursera course assignment to analyse and clean data. 
The data was retrieved from the Human Activity Recognition Using Smartphones Data Set, from the UCI Machine Learning repository (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), and is available for download from the following web location: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


### Assumptions and dependecies
The run_analysis.R file assumes, that the .zip file was downloaded and extracted with relative paths in the current working directory.
run_analysis.R assumes that the following R packages have been installed:

    dplyr
    plyr


### Variables (column number, column name)
The processed dataset (tidy_data.txt) contains the following variables, as aggregated means by subject and activity.
For a full description of the variables, please see features_info.txt in the source files.


    1  subject
    2	activity
    3	tBodyAccmeanX
    4	tBodyAccmeanY
    5	tBodyAccmeanZ
    6	tGravityAccmeanX
    7	tGravityAccmeanY
    8	tGravityAccmeanZ
    9	tBodyAccJerkmeanX
    10	tBodyAccJerkmeanY
    11	tBodyAccJerkmeanZ
    12	tBodyGyromeanX
    13	tBodyGyromeanY
    14	tBodyGyromeanZ
    15	tBodyGyroJerkmeanX
    16	tBodyGyroJerkmeanY
    17	tBodyGyroJerkmeanZ
    18	tBodyAccMagmean
    19	tGravityAccMagmean
    20	tBodyAccJerkMagmean
    21	tBodyGyroMagmean
    22	tBodyGyroJerkMagmean
    23	fBodyAccmeanX
    24	fBodyAccmeanY
    25	fBodyAccmeanZ
    26	fBodyAccmeanFreqX
    27	fBodyAccmeanFreqY
    28	fBodyAccmeanFreqZ
    29	fBodyAccJerkmeanX
    30	fBodyAccJerkmeanY
    31	fBodyAccJerkmeanZ
    32	fBodyAccJerkmeanFreqX
    33	fBodyAccJerkmeanFreqY
    34	fBodyAccJerkmeanFreqZ
    35	fBodyGyromeanX
    36	fBodyGyromeanY
    37	fBodyGyromeanZ
    38	fBodyGyromeanFreqX
    39	fBodyGyromeanFreqY
    40	fBodyGyromeanFreqZ
    41	fBodyAccMagmean
    42	fBodyAccMagmeanFreq
    43	fBodyBodyAccJerkMagmean
    44	fBodyBodyAccJerkMagmeanFreq
    45	fBodyBodyGyroMagmean
    46	fBodyBodyGyroMagmeanFreq
    47	fBodyBodyGyroJerkMagmean
    48	fBodyBodyGyroJerkMagmeanFreq
    49	angletBodyAccMean,gravity
    50	angletBodyAccJerkMean,gravityMean
    51	angletBodyGyroMean,gravityMean
    52	angletBodyGyroJerkMean,gravityMean
    53	angleX,gravityMean
    54	angleY,gravityMean
    55	angleZ,gravityMean
    56	tBodyAccstdX
    57	tBodyAccstdY
    58	tBodyAccstdZ
    59	tGravityAccstdX
    60	tGravityAccstdY
    61	tGravityAccstdZ
    62	tBodyAccJerkstdX
    63	tBodyAccJerkstdY
    64	tBodyAccJerkstdZ
    65	tBodyGyrostdX
    66	tBodyGyrostdY
    67	tBodyGyrostdZ
    68	tBodyGyroJerkstdX
    69	tBodyGyroJerkstdY
    70	tBodyGyroJerkstdZ
    71	tBodyAccMagstd
    72	tGravityAccMagstd
    73	tBodyAccJerkMagstd
    74	tBodyGyroMagstd
    75	tBodyGyroJerkMagstd
    76	fBodyAccstdX
    77	fBodyAccstdY
    78	fBodyAccstdZ
    79	fBodyAccJerkstdX
    80	fBodyAccJerkstdY
    81	fBodyAccJerkstdZ
    82	fBodyGyrostdX
    83	fBodyGyrostdY
    84	fBodyGyrostdZ
    85	fBodyAccMagstd
    86	fBodyBodyAccJerkMagstd
    87	fBodyBodyGyroMagstd
    88	fBodyBodyGyroJerkMagstd