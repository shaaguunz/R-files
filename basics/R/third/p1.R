best<-function(state,outcome){
    outcomes<-c("heart attack","heart failure","pneumonia")
    if (outcome %in% outcomes==FALSE) stop("invalid outcome")
    
    
    ##to read
    files<-dir()
    datas<-read.csv(files[2],colClasses="character")
    
    
    #to filter
    datas<-datas[c(2,7,11,17,23)]
    names(datas)[1]<-"name"
    names(datas)[2]<-"state"
    names(datas)[3]<-"heart attack"
    names(datas)[4]<-"heart failure"
    names(datas)[5]<-"pneumonia"
    
    
    #to validate
    states<-datas[,2]
    states<-unique(states)
    if(state %in% states==FALSE) stop("invalid state")
    
    datas<-datas[datas$state==state & datas[outcome]!='Not Available',]
    val<-datas[,outcome]
    rowNum<-which.min(val)
    
    
    datas[rowNum,]$name
}