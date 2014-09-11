
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

#> len3 <- as.data.frame(cbind(len1,len2))
#> names(len3)[1] <- "id"
#> names(len3)[2] <- "nobs"
#> len3
        
#complete <- function(directory, id = 1:332) {
#        filelist <- list.files(directory, full.names = TRUE)
#        dat <- data.frame()
#        for (i in 1:332) {
#                dat <- rbind(dat,read.csv(filelist[i]))
#        }
#        dat_subset <- data.frame()
#        for (j in id){
#                dat_subset <- rbind(dat_subset, dat[dat[,"ID"] == j,])
#        }
#        dat_complete <- dat_subset[!is.na(dat_subset$sulfate & dat_subset$nitrate),]   
#        dat2 <- NULL
#        dat3 <- NULL
#        for (j in id){
#                dat2[j] <- length(dat_complete[dat_complete$ID==j,"ID"])
#                dat3[j] <- j
#        }
#        completes <- as.data.frame(cbind(dat3,dat2))
#        names(completes)[1] <- "id"
#        names(completes)[2] <- "nobs"
#        
#        comps2 <- completes[complete.cases(completes),]
#        
#        comps2
#           
#}

### submission instructions
#source("http://d396qusza40orc.cloudfront.net/rprog%2Fscripts%2Fsubmitscript1.R")
#submit()
## PW: SDusP7mT48

complete <- function(directory, id = 1:332) {
       
        filelist <- list.files(directory, full.names = TRUE)
        
        dat <- data.frame()
        nobs <- NULL
        
        for (i in id) {
                dat <- rbind(dat,read.csv(filelist[i]))
        }
        
        ds <- dat[!is.na(dat$sulfate & dat$nitrate),]
        
        for (j in id) {
                nobs <- c(nobs,nrow(ds[ds$ID == j,]))
        }
        
        data.frame("id" = id,"nobs" = nobs)
}









        