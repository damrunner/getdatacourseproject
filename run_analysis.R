# An R script written to merge, rename, and subset the UCI data sets and output a second,
# independent tidy data set with the average of each mean and standard deviation variable
# for each subject and each activity.

run_analysis <- function() {
        
        # checks for and loads required packages
        if(!require("plyr")) {
                install.packages("plyr")
                require("plyr")
        }
        if(!require("reshape2")) {
                install.packages("reshape2")
        }
        
        # reads data in
        subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
        x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
        y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
        subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
        x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
        y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
        features <- read.table("UCI HAR Dataset/features.txt")
        act.labels <- read.table("UCI HAR Dataset/activity_labels.txt")
        
        # fits train and test subject datasets together and applies labels
        subject <- rbind(subject_test, subject_train)
        colnames(subject) <- "subject"
        
        # fits test and training labels together and applies labels
        activity <- rbind(y_test,y_train)
        activity <- merge(activity,act.labels,by=1)[,2]
        
        # fits test and training data together and applies labels
        x <- rbind(x_test,x_train)
        colnames(x) <- features[,2]
        
        # merge all data into single dataframe
        allData <- cbind(subject,activity,x)
        
        # extracts mean and standard deviation columns
        newData <- allData[,grep("mean|std|subject|activity",colnames(allData),value=TRUE)]
        
        # melts dataset, groups by subject and activity, and computes the mean
        melt <- melt(newData, id.var=c("subject","activity"))
        means <- dcast(melt, subject+activity~variable, mean)
        
        # cleans environment and writes new table
        write.table(means, file="tidy_data.txt", row.name=FALSE)
        View(means)
}