Code Book
======

This code book describes the analysis performned for the data cleaning class project.

The original data can be found here:https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The description of the dataset can be found here:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The run_analysis.R script is straightforward and performs the objectives in the class assignment.

It is labeled with comments for each section.

The script performs:
	1.  downloads the data and then unzips it
	2.  reads in the tables containing the variable names and acitivity codes
	3. renames some of the variables with more descriptive names
	4. loads the test dataset, its labels which are the activity codes, and the subjects associated with each obs; renaming variables for clarity
	5. renames the variables in the test data with the descriptive names
	6. merges all of these datasets together for a complete test data set
	7.  repeat steps 4 through 6 for the train data set
	8.  append merge the train and test data sets
	9.  select out just the variables that contain the words, "mean", "std", "activity", or "subject"
	10.  load the dplyr package
	11.  use the dplyr functions to identify the group-by variables (i.e. subject and activity combinations)
	12.  create a new dataset ("mean") that contains the means of each variable within the defined groups.
	13.  write out the mean data set as "tidy.txt"
