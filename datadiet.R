pollutantmean <- function(directory, pollutant, id = 1:332) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'pollutant' is a character vector of length 1 indicating
        ## the name of the pollutant for which we will calculate the
        ## mean; either "sulfate" or "nitrate".
        
        ## 'id' is an integer vector indicating the monitor ID numbers
        ## to be used
        
        ## Return the mean of the pollutant across all monitors list
        ## in the 'id' vector (ignoring NA values)
        
        mean(1:10,)
}

len <- length(files)
dat <- data.frame()
for(i in 1:len){
        dat <- rbind(dat, read.csv(files[i]))
        
}

weightmedian <- function(directory, day) {
        files <- list.files(directory, full.names = TRUE)
        len <- length(files)
        dat <- data.frame()
        for (i in 1:len){
                dat <- rbind(dat, read.csv(files[i]))
        }
        dat_subset <- dat[dat$Day == day,]
        median(dat_subset$Weight, na.rm = TRUE)
}