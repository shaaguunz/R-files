pollutantmean<-function(pollutant,id=1:332)
{
    files<-dir()
    data<-data.frame()
    for( i in id){
        data<-rbind(data,read.csv(files[i]))
    }
    sulfate<-data[,2]
    nitrate<-data[,3]
    if(pollutant=='sulfate')
    {
        mean(sulfate,na.rm=TRUE)
    }
    else{
        mean(nitrate,na.rm=TRUE)
    }
    
}


