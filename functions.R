add2 <- function(x, y) {
        x + y
}

above10 <- function(x) {
        use <- x > 10
        x[use]
}

above <- function(x, n = 10) {
        use <- x > n
        x[use]
}

columnmean <- function(y, removeNA = TRUE) {
        ##y is a dataframe or matrix
        nc <- ncol(y) ## number of columns in y
        means <- numeric(nc) ##numeric vector equal to length of nc to store means
        for(i in 1:nc) {
                means[i] <- mean(y[,i], na.rm = removeNA)
        }
        means
}