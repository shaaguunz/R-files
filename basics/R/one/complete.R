complete<-function(id=1:332){
    files<-dir()
    nobs<-c()
    for( i in id){
        data<-read.csv(files[i])
        sum_complete<-sum(complete.cases(data))
        nobs<-c(nobs,sum_complete)
    }
    dat<-data.frame(id,nobs)
    dat
    
}