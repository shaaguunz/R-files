---
title: "REproduce"
output: html_document
---
## loading and pre processing the data
```{r load,echo=TRUE}
data<-read.csv("activity.csv",header = TRUE)

```
#Process/transform the data (if necessary) into a format suitable for your analysis
What is mean total number of steps taken per day?
For this part of the assignment, you can ignore the missing values in the dataset.

1. Calculate the total number of steps taken per day
```{r stepsInDAy , echo=TRUE}
stepsByDay<-aggregate(steps~date,data,sum)


```

2.  If you do not understand the difference between a histogram and a barplot, research the difference between them. Make a histogram of the total number of steps taken each day


```{r histogram1, echo=TRUE}
hist(stepsByDay$steps,col="chocolate",
     xlab = "steps", main="Total number of steps in a day")

```
3  Calculate and report the mean and median of the total number of steps taken per day

```{r mean1,echo=TRUE}
mean1<-mean(stepsByDay$steps)
mean1

median1<-median(stepsByDay$steps)
median1

```

##What is the average daily activity pattern?
1.  Make a time series plot (i.e. \color{red}{\verb|type = "l"|}type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)
```{r rim1,echo=TRUE}
avgsteps<-aggregate(steps~interval,data,mean)
with(avgsteps, plot(interval,steps, main="Average number of steps taken"))


```
2.   which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?

```{r avg5,echo=TRUE}
max1<-max(avgsteps$steps)

maxinter<-subset(avgsteps,steps==max1)

```


## Imputing missing values

1.  Calculate and report the total number of missing values in the dataset (i.e. the total number of rows with \color{red}{\verb|NA|}NAs)

```{r  withNA,echo=TRUE}
colSums((is.na(data)))

```


2.  Create a new dataset that is equal to the original dataset but with the missing data filled in.

to fill in missing values  with mean

```{r miss,echo=TRUE}
data$mean2<-avgsteps$steps
data$steps[is.na(data$steps)]<-data$mean2

newdata<-data
```


3.   Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total number of steps taken per day. 

first calculate total number of steps per day and then plot
```{r hist2, echo=TRUE}
sumnew<-aggregate(steps~date,newdata,sum)
hist(sumnew$steps, col="red",
     xlab="Steps",
     main="Total steps without NA")
```

4. Calculate and report the mean and median total number of steps taken per day

```{r meanandme , echo=TRUE}
mean2<-mean(sumnew$steps)
median2<-median(sumnew$steps)
mean2
median2

```
calculate the difference
```{r diff,echo =TRUE}
mean2-mean1
median2-median1
```

##Are there differences in activity patterns between weekdays and weekends?


1.  Create a new factor variable in the dataset with two levels – “weekday” and “weekend” indicating whether a given date is a weekday or weekend day.


```{r factor ,echo=TRUE}

library(timeDate)
newdata$Weekday<-isWeekday(newdata$date)

weekday<-subset(newdata,newdata$Weekday=="TRUE")
weekdaymean<-aggregate(steps~interval,weekday,mean)

weekend<-subset(newdata,newdata$Weekday=="FALSE")
weekendmean<-aggregate(steps~interval,weekend,mean)


```

2. Make a panel plot containing a time series plot (i.e. \color{red}{\verb|type = "l"|}type = "l") of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all weekday days or weekend days (y-axis).
```{r pabnel,echo=TRUE}

layout(matrix(c(1,1,2,2), 2, 2, byrow = TRUE))
plot(weekdaymean$interval, weekdaymean$steps
     , xlab = "interval", ylab = "Number of steps"
     , main ="Weekday", col ="blue", type="l") 
plot(weekendmean$interval, weekendmean$steps
     , xlab = "interval", ylab = "Number of steps"
     , main ="Weekend", col ="red", type="l")
```






