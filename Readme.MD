---
title: "Readme"
author: "WS Hoekstra"
date: "Saturday, May 23, 2015"
output: html_document
---

## Steps
The run_analysis.R file manipulates the source data in the following way:

   * Appends the activity labels and subject identifiers to the raw data
   * Sets the column names of all the measurements according to the labels specified in the features.txt file
   * Removes measurement variables which don't contain the substring "mean" or "std", to isolate the measurements that are means or standard deviations
   * Summarizes the rows by the measurement means by subject and activity
   * Write the results to a file called "tidy_data.txt" in the working directory