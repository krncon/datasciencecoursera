corr <- function(directory, threshold = 0){
        
        ## create file list
        all_files <- list.files(directory, full.names = T)
        
        num_complete_obs <- complete(directory) ## creates data frame of complete observation counts 
        above_threshold <- num_complete_obs[["nobs"]] > threshold ## logical vector indicating where threshold is met
        indices <- which(above_threshold) ## vector of file numbers that meet threshold
        
        ## create empty numeric vector
        correlations <- vector(mode = "numeric", length = 0)
        
        for(i in indices){
                NewFile <- read.csv(sprintf("/home/kconnelly/datasciencecoursera/%s/%03d.csv", directory, i), header = T, na.strings = c("NA", "NaN", " "))
                CompleteObs <- NewFile[which(complete.cases(NewFile)),]
                correlations <- c(correlations, cor(CompleteObs$sulfate, CompleteObs$nitrate))
        }
        
        correlations
}
