best <- function(state, outcome) {
        
        ## Read outcome data
        data <- 
        read.csv("outcome-of-care-measures.csv", 
        colClasses = "character")
        
        ## Create vector of valid States
        state.names <- unique(data$State)
        
        ## Check to see if state input is valid
        if(state %in% state.names != TRUE) stop("invalid state")
        
        ## Create vector of valid outcomes
        outcome.names <- c("pneumonia","heart attack", "heart failure")
        
        ## Check to see if outcome input is valid
        if(outcome %in% outcome.names != TRUE) stop("invalid outcome")
        
        
        statelist <- data[data$State == state,]
        
        statelist[,11]<-as.numeric(statelist[,11])
        statelist[,17]<-as.numeric(statelist[,17])
        statelist[,23]<-as.numeric(statelist[,23])
        
        if (outcome == "pneumonia") x <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
        if (outcome == "heart attack") x <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
        if (outcome == "heart failure") x <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
        
        
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        statelist[order(statelist[x], statelist$Hospital.Name , na.last = NA),][1,2]
        
}
        