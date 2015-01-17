pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values
  
  # source("~/Documents/pablo/coursera/rprog/pollutantmean.R")
  # directory<-"~/Documents/pablo/coursera/rprog/specdata"
  setwd(directory)
#   file.name<-paste(sprintf("%03d",id[1]),"csv",sep=".")
#   file<-read.csv(file.name)
#   good<-complete.cases(file)
#   file.good<-file[good,][[pollutant]]
#   rm(file)
  file.good<-NULL;
  for(i in 1:length(id))
  {
    file.name<-paste(sprintf("%03d",id[i]),"csv",sep=".")
    file<-read.csv(file.name)
    good<-complete.cases(file)
    file.good.temp<-file[good,][[pollutant]]
    file.good<-c(file.good,file.good.temp)
    rm(file)
    rm(file.good.temp)
  }
  pollutant.mean<-sum(file.good)/length(file.good)
}