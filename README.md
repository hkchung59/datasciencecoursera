1. Script running process for merging train and test data
  1.1 setting working directory in the local d:\\Getting and Cleaning Data\\
  1.2 Features.txt file conversion to get the list of features to use
  1.3 Activity_labels file conversion to know what activities to be assigned using sep="\t"
  1.4 x_test,y_test,subject_test file read and assign associated column name to y_test and subject_test each "activityName"
      and "subjNum" respectively
  1.5 Combined the above three file(1.4) into one as xysubjTestBinded
  1.6 x_train,y_train,subject_train file read and assign associated column name to y_train and subject_train each
      "activityName" and "subjNum" respectively
  1.7 Combined the above three file(1.6) into one as xysubjTrainBinded
  1.8 Variable crosss check using intersection function
  1.9 Merged train and test file into one(finalMergedData) with subject number and activity number column
2. Extraction of mean and std associated features
  2.1 Total number of features associated with mean and std are 64 variables
  2.2 New data extraction from the merged data using subset function
  2.3 Default column names used for the features except already assigned name like "subjNum" and "activityName"
  2.4 Assign descriptive variable names to new data called newExtraction using descriptive info from features.txt
3. Calculation of average per variable in each activity per subject using reshape2 package
  3.1 Used melt function using two id subjNum and activityName covering all all identified variables in the 2.1
  3.2 Used dcast with a pair variable(subjNum+activityName) to calculate average of the variables identified in 2.1
4. Conversion and assigning activity name in a proper self descriptive name
  4.1 Found activity numbers and associted detailed activity names in the activity_labels.txt
  4.2 Replace activity number into dself explanatory descriptive names
5. Save the final data into a text file
  5.1 Saved a text file called "newTidyData.txt" using write.csv funtion
  
