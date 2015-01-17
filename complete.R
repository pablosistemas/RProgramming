complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  setwd(directory)
  
  nobs<-vector(mode="integer",length=(length(id)))
  
  files<-system("ls",intern=TRUE)
  for(i in 1:length(id))
  {
    file<-read.csv(files[id[i]]); 
    good<-complete.cases(file);
    nobs[i]<-sum(good)
    rm(file)
  }
  result<-data.frame(id=id,nobs=nobs)
}