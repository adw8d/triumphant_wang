best <- function(state, outcome) {
        
        ## Read outcome data
        data <- read.csv("outcome-of-care-measures.csv", 
        colClasses = "character")
        
        ## Check that state and outcome are valid
        
        if (is.element(state, unique(data[,7])) == FALSE){
                print("invalid state")
                
                
        
                
        statelist <- data[data$State == state,]
        
        if (outcome == "pneumonia") {
                x <- "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia"
        } 
        if (outcome == "heart attack") {
                x <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack"
        }
        if (outcome == "heart failure") {
                x <- "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure"
        }
           
        
        ## Return hospital name in that state with lowest 30-day death
        ## rate
        
        statelist[order(statelist[x]),][1,2]
        
        
           
               
}
        
        
        
        
