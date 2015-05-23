---
title: "Readme"
author: "WS Hoekstra"
date: "Saturday, May 23, 2015"
output: html_document
---

### Description
This repository was created as part of a Coursera course assignment to analyse and clean data. 
The data, which is processed by the scripts in this reposiory, was retrieved from the Human Activity Recognition Using Smartphones Data Set, from the UCI Machine Learning repository (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). The source data is available for download from the following web location: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Steps
The run_analysis.R file manipulates the source data in the following way:

   * Appends the activity labels and subject identifiers to the raw data
   * Sets the column names of all the measurements according to the labels specified in the features.txt file
   * Removes measurement variables which don't contain the substring "mean" or "std", to isolate the measurements that are means or standard deviations
   * Summarizes the rows by the measurement means by subject and activity
   * Write the results to a file called "tidy_data.txt" in the working directory