## Coursera Project

setwd("D:\\Getting and Cleaning Data\\")
if (!file.exists("data")) {
  dir.create("data")
}

## Feature Code Conversion
featuresCode<-read.csv("./data/features.txt", sep="",header=FALSE)
colnames(featuresCode)<-c("featureNum","featureName")
head(featuresCode)

## Activity Label Conversion
labelActivity<-read.csv("./data/activity_labels.txt",sep="\t",header=FALSE)
colnames(labelActivity)<-c("activityName")

## Test Data Binding
xTest<-read.csv("./data/x_test.txt", sep="",header=FALSE)
yTest<-read.csv("./data/y_test.txt", sep="",header=FALSE)
colnames(yTest)<-c("activityName")
subjTest<-read.csv("./data/subject_test.txt", sep="",header=FALSE)
colnames(subjTest)<-c("subjNum")
xysubjTestBinded<-cbind(xTest,yTest,subjTest)

## Train Data Binding
xTrain<-read.csv("./data/x_train.txt",sep="",header=FALSE)
yTrain<-read.csv("./data/y_train.txt",sep="",header=FALSE)
colnames(yTrain)<-c("activityName")
subjTrain<-read.csv("./data/subject_train.txt", sep="",header=FALSE)
colnames(subjTrain)<-c("subjNum")
xysubjTrainBinded<-cbind(xTrain,yTrain,subjTrain)

## Verify Variables Intersection
intersect(names(xysubjTestBinded),names(xysubjTrainBinded))

## Merging Train/Test Data
finalMergedData<-merge(xysubjTestBinded,xysubjTrainBinded,all=TRUE)

## Extraction mean and std Variables(total: 64 varaibles)
newExtraction<-subset(finalMergedData, select=c(subjNum,activityName,V1:V6,V41:V46,
                                                V81:V86,V121:V126,V161:V166,
                                                V201:V202,V214:V215,V227:V228,
                                                V240:V241,V253:V254,V266:V271,
                                                V345:V350,V424:V429,V503:V504,
                                                V529:V530,V542:V543))
## Column Name Assignment
colnames(newExtraction)<-c("subjNum", "activityName","tBodyAcc-mean()-X",
                           "tBodyAcc-mean()-Y","tBodyAcc-mean()-Z","tBodyAcc-std()-X","tBodyAcc-std()-Y",
                           "tBodyAcc-std()-Z","tGravityAcc-mean()-X","tGravityAcc-mean()-Y","tGravityAcc-mean()-Z",
                           "tGravityAcc-std()-X","tGravityAcc-std()-Y","tGravityAcc-std()-Z",
                           "tBodyAccJerk-mean()-X","tBodyAccJerk-mean()-Y","tBodyAccJerk-mean()-Z",
                           "tBodyAccJerk-std()-X","tBodyAccJerk-std()-Y","tBodyAccJerk-std()-Z",
                           "tBodyGyro-mean()-X","tBodyGyro-mean()-Y","tBodyGyro-mean()-Z",
                           "tBodyGyro-std()-X","tBodyGyro-std()-Y","tBodyGyro-std()-Z","tBodyGyroJerk-mean()-X",
                           "tBodyGyroJerk-mean()-Y","tBodyGyroJerk-mean()-Z","tBodyGyroJerk-std()-X",
                           "tBodyGyroJerk-std()-Y","tBodyGyroJerk-std()-Z","tBodyAccMag-mean()",
                           "tBodyAccMag-std()","tGravityAccMag-mean()","tGravityAccMag-std()",
                           "tBodyAccJerkMag-mean()","tBodyAccJerkMag-std()","tBodyGyroMag-mean()",
                           "tBodyGyroMag-std()","tBodyGyroJerkMag-mean()","tBodyGyroJerkMag-std()",
                           "fBodyAcc-mean()-X","fBodyAcc-mean()-Y","fBodyAcc-mean()-Z","fBodyAcc-std()-X",
                           "fBodyAcc-std()-Y","fBodyAcc-std()-Z","fBodyAccJerk-mean()-X","fBodyAccJerk-mean()-Y",
                           "fBodyAccJerk-mean()-Z","fBodyAccJerk-std()-X","fBodyAccJerk-std()-Y",
                           "fBodyAccJerk-std()-Z","fBodyGyro-mean()-X","fBodyGyro-mean()-Y",
                           "fBodyGyro-mean()-Z","fBodyGyro-std()-X","fBodyGyro-std()-Y","fBodyGyro-std()-Z",
                           "fBodyAccMag-mean()","fBodyAccMag-std()","fBodyBodyGyroMag-mean()",
                           "fBodyBodyGyroMag-std()","fBodyBodyGyroJerkMag-mean()","fBodyBodyGyroJerkMag-std()")

library(reshape2)

## Average calculation using melt and dcast function
subjMelt<-melt(newExtraction,id=c("subjNum","activityName"),
               measure.vars=c("tBodyAcc-mean()-X",
                              "tBodyAcc-mean()-Y","tBodyAcc-mean()-Z","tBodyAcc-std()-X","tBodyAcc-std()-Y",
                              "tBodyAcc-std()-Z","tGravityAcc-mean()-X","tGravityAcc-mean()-Y","tGravityAcc-mean()-Z",
                              "tGravityAcc-std()-X","tGravityAcc-std()-Y","tGravityAcc-std()-Z",
                              "tBodyAccJerk-mean()-X","tBodyAccJerk-mean()-Y","tBodyAccJerk-mean()-Z",
                              "tBodyAccJerk-std()-X","tBodyAccJerk-std()-Y","tBodyAccJerk-std()-Z",
                              "tBodyGyro-mean()-X","tBodyGyro-mean()-Y","tBodyGyro-mean()-Z",
                              "tBodyGyro-std()-X","tBodyGyro-std()-Y","tBodyGyro-std()-Z","tBodyGyroJerk-mean()-X",
                              "tBodyGyroJerk-mean()-Y","tBodyGyroJerk-mean()-Z","tBodyGyroJerk-std()-X",
                              "tBodyGyroJerk-std()-Y","tBodyGyroJerk-std()-Z","tBodyAccMag-mean()",
                              "tBodyAccMag-std()","tGravityAccMag-mean()","tGravityAccMag-std()",
                              "tBodyAccJerkMag-mean()","tBodyAccJerkMag-std()","tBodyGyroMag-mean()",
                              "tBodyGyroMag-std()","tBodyGyroJerkMag-mean()","tBodyGyroJerkMag-std()",
                              "fBodyAcc-mean()-X","fBodyAcc-mean()-Y","fBodyAcc-mean()-Z","fBodyAcc-std()-X",
                              "fBodyAcc-std()-Y","fBodyAcc-std()-Z","fBodyAccJerk-mean()-X","fBodyAccJerk-mean()-Y",
                              "fBodyAccJerk-mean()-Z","fBodyAccJerk-std()-X","fBodyAccJerk-std()-Y",
                              "fBodyAccJerk-std()-Z","fBodyGyro-mean()-X","fBodyGyro-mean()-Y",
                              "fBodyGyro-mean()-Z","fBodyGyro-std()-X","fBodyGyro-std()-Y","fBodyGyro-std()-Z",
                              "fBodyAccMag-mean()","fBodyAccMag-std()","fBodyBodyGyroMag-mean()",
                              "fBodyBodyGyroMag-std()","fBodyBodyGyroJerkMag-mean()","fBodyBodyGyroJerkMag-std()"),
                              na.rm=FALSE)
newTidyData<-dcast(subjMelt,subjNum+activityName~variable,mean)

## Activity Naming
newTidyData$activityName[newTidyData$activityName=="1"]<-"WALKING"
newTidyData$activityName[newTidyData$activityName=="2"]<-"WALKING_UPSTAIRS"
newTidyData$activityName[newTidyData$activityName=="3"]<-"WALKING_DOWNSTAIRS"
newTidyData$activityName[newTidyData$activityName=="4"]<-"SITTING"
newTidyData$activityName[newTidyData$activityName=="5"]<-"STANDING"
newTidyData$activityName[newTidyData$activityName=="6"]<-"LAYING"

##Final Report File Writing
write.csv(newTidyData,"newTidyData.txt")
