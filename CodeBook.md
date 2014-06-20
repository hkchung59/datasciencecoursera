## Codes, Variables, Functions Used in the run_analysis.R

###Initial Setting Works
1. Default working directory setting in d: local disk under Getting and Cleaning Data directory
2. Features infos are assigned to featuresCode
3. Activity numbers and names are assigned labelActivity

### Test Data Combining
1. x_test is assigned to xTest
2. y_test is assigned to yTest and column named "activityName"
3. subject_test is assigned to subjTest and column named "subjNum"
4. xTest,yTest and subjTest binded in xysubjTestBinded data using cbind function

### Train Data Combining
1. x_train is assigned to xTrain
2. y_train is assigned to yTrain and column named "activityName"
3. subject_train is assigned to subjTrain and column named "subjNum"
4. xTrain,yTrain and subjTrain binded in xysubjTrainBinded data using cbind function

### Merging train and test data
1. Merged two data sets(xysubjTestBinded and xysubjTrainBinded) into finalMergedData using merge function

### Extraction of subset using selected variables(mean and std) total 64 and column naming
1. Extraction using subset function from finalMergedData including subjNum and activityName variables
2. Default variable name used for 64 variables
3. Column names assigned to replace default ones in a more descriptive way using colnames function

### Average calculation per variables identified in each activity and each subject
1. Used reshape2 package
2. Used melt and dcast function
3. To make a second tidy data(newTidyData), used a paired variable(subjNum+activityName) and calculate mean 
   in the measure.vars
4. Created newTidyData set

### Replacing activity numbers into more self explanatory names
1. Used labelActivity info to relate into numbers and names in the newTidyData set
2. Save newTidyData set into a text file called newTidyData.txt using write.csv function
3. It is 180 rows x 66 column file except heading
