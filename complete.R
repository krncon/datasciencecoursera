complete <- function(directory, id = 1:332) {
        
        ## create file list
        all_files <- list.files(directory, full.names = T)
        
        ## create empty dataframe
        compData <- data.frame()
        
        ## read each file, count complete observations and combine results
        for (i in id){
                file_i <- read.csv(sprintf("/home/kconnelly/datasciencecoursera/%s/%03d.csv", directory, i), header = T, na.strings = c("NA", "NaN", " "))
                nobs <- sum(complete.cases(file_i))  ## count the number of complete observations
                newData <- data.frame(i, nobs)       ## Store i and nobs from current file
                compData <- rbind(compData, newData) ## Add new data to compData
        }
        
        colnames(compData) <- c("id", "nobs")
        compData
}
