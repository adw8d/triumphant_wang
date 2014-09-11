corr <- function(directory, threshold = 0) {
        ## 'directory' is a character vector of length 1 indicating
        ## the location of the CSV files
        
        ## 'threshold' is a numeric vector of length 1 indicating the
        ## number of completely observed observations (on all
        ## variables) required to compute the correlation between
        ## nitrate and sulfate; the default is 0
        
        ## Return a numeric vector of correlations
        
        filelist <- list.files(directory, full.names = TRUE)
        dat <-NULL
        
        for (i in 1:332) {
                dat <- rbind(dat,read.csv(filelist[i]))
        }
        
        ds <- dat[!is.na(dat$sulfate) & !is.na(dat$nitrate),]
        
        ## I want a vector of the ID numbers that fit the threshold
        v <- NULL
        
        for (i in 1:332) {
                if(nrow(ds[ds$ID == i,]) > threshold)
                v <- c(v,i)
        }
        
        
        ds <- ds[ds$ID %in% v,]
        
        z <- split(ds,ds$ID)
        
        a <- sapply(z,function(x) cor(x$nitrate,x$sulfate,use="complete.obs"))
        
        as.vector(a)
                
}

