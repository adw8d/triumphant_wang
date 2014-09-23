makeVector <- function(x = numeric()) { 
        
        ## Create a function called "MakeVector" that 
        ## takes a numeric vector x as its argument
        
        m <- NULL 
        
        ## creates dummy object m, conceivably to put
        ## mean value inside (?)
        
        set <- function(y) { 
                
        ## creates a function called "set" which takes 
        ## y as its argument
                
                x <<- y 
                
                ## whatever we assign to the "y" in set()
                ## function will replace the "x" that 
                ## exists in the original makeVector()
                ## function
                
                m <<- NULL
                
                ## m gets assigned to null again
                ## ... no idea why
                
        }
        
        get <- function() x
        
        ## creates a get() function that returns the value of 
        ## x, the original vector (or the vector that was
        ## set later using "set()")
        
        setmean <- function(mean) m <<- mean
        
        ## creates a function called "setmean" that takes as its
        ## argument a variable called "mean", which it then 
        ## assigns to the parent environment "m" value        
        
        getmean <- function() m
        
        ## creates a function called "getmean" that returns the
        ## value of "m" - the mean of the parent function        
        
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)
        
        ## returns a list that says "set, get, setmean, getmean"...
        ## not sure why.
}

cachemean <- function(x, ...) {
        
        ## creates a function called "cachemean" that takes x as its argument
        
        m <- x$getmean()
        
        ## assigns the value of the $getmean() function to m
        
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
                
                ## if m is not NULL, then return the value of m...
                ## this is the mean of x
        }
        data <- x$get()
        
        ## assign the vector "x" to a variable called "data" using the
        ## makeVector() subfunction get()
        
        m <- mean(data, ...)
        
        ## assign to "m" the mean of the "data" vector
        
        x$setmean(m)
        
        ## set the mean of the vector (now named "m") to the "m" variable
        ## in the original environment of the makeVector() function
        
        m
        
        ## return the value of m
}