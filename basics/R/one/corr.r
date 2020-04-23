corr<-function(threshold=0){
    files<-dir()
    output<-numeric()
    for( i in files){
        data<-read.csv(i)
        cor_value<-0
        value<-sum(complete.cases(data))
        data<-data[complete.cases(data),]
        if(value>threshold){
            sulfate<-data[["sulfate"]]
            nitrate<-data[["nitrate"]]
            cor_value<-cor(nitrate,sulfate,use='pairwise.complete.obs')
            output<-c(output,cor_value)
            }
    }
output
}