Getting and Cleaning Data Course Project
====================

This repository contains data and scripts to complete the course project for Coursera's "Getting and Cleaning Data" in partnership with Johns Hopkins University.

Detailed information about the data and how it was transformed is contained in CodeBook.md.

At a high level, this R code creates a tidy data set with the average, by subject and activity, of select variables from an experiment conducted by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto on human activity recognition using smartphones.

To use this script, download the raw data from the following link (information on the experiment is included in the "README.txt" file in the downloaded data:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Extract it into the working directory for your project, after which you can run or source the function run_analysis.R, which will output a text file named "tidy_data.txt" that will contain the average of each activity by subject.
