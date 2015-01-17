corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  setwd(directory)
  
  files<-system("ls",intern=TRUE)
  corr<-vector(mode="numeric",length=(length(files)))
  for(i in 1:length(files))
  {
    file<-read.csv(files[i]); 
    good<-complete.cases(file);
    if(sum(good) > threshold)
    {
      file<-file[good,]
      corr[i] <- cor(x=file$nitrate,y=file$sulfate)
    }
    rm(file)
  }
  corr<-corr[corr!=0]
}