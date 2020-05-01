#1. merge the training and test data
# 2. Extract only the measurement on the mean and standard deviation
# 3. use descriptive activity to name activities
# 4. label appropriately
# 5. create a independent tidy data set
library(reshape2)
library(data.table)

#the file is already downloaded and unzipped
#loading all the datas
x_test<-read.table("./UCI HAR Dataset/test/x_test.txt")
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")


x_train<-read.table("./UCI HAR Dataset/train/x_train.txt")
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")

#merging to create a new dataset   (vertically)
x_merged<-rbind(x_test,x_train)
y_merged<-rbind(y_test,y_train)
subject_merged<-rbind(subject_test,subject_train)


#adding new column name
names_features<-read.table(".//UCI HAR DATASET//features.txt")
names_features<-names_features$V2
colnames(x_merged)<-names_features


# extracting only the measurements on mean and std 
subset_merged<-x_merged[,grep("mean|std",colnames(x_merged))]

#descriptive names for cols
names(y_merged)<-("ActivityID")
names(x_merged)<-("ActivityLabel")
names(subject_merged)<-"Subject"

# creating a second independent dataset
all_merged<-cbind(subject_merged,y_merged,x_merged)
all_labels<-c("Subject","ActivityID","ActivityLabel")


labels.data<-setdiff(colnames(all_merged),all_labels)
data_melted<-melt(all_merged,mid=all_labels,measure.vars=labels.data,na.rm=TRUE)
tidy.data<-dcast(data_melted,Subject+ActivityLabel~variable,mean)

write.table(tidy.data,file=".//tidy_data.txt",row.names=FALSE)

