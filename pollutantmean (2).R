## pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
## }

## directory = "C:/Users/awheeler/Documents/R/specdata"

## submission password: SDusP7mT48

## pollutantmean <- function(directory, pollutant, id = 1:332){
#        filelist <- list.files(directory, full.names = TRUE)
#        dat <- data.frame()
#        for (i in 1:332) {
#                dat <- rbind(dat,read.csv(filelist[i]))
#        }
#        dat_subset <- data.frame()
#        for (j in id){
#                dat_subset <- rbind(dat_subset, dat[dat[,"ID"] == j,])
#        }
#        mean(dat_subset[,pollutant], na.rm = TRUE)
#}

pollutantmean <- function(directory, pollutant, id = 1:332){
        filelist <- list.files(directory, full.names = TRUE)
        dat <- data.frame()
        for (i in id) {
                dat <- rbind(dat,read.csv(filelist[i]))
        }
        mean(dat[,pollutant],na.rm=TRUE)
}
        

