pollutantmean <- function(directory, pollutant, id = 1:332){
        
        ## create file list
        all_files <- list.files(directory, full.names = T)
        
        ## create empty dataframe
        pmdata <- data.frame()
        
        for(i in id){
                pmdata <- rbind(pmdata, read.csv(sprintf("/home/kconnelly/datasciencecoursera/%s/%03d.csv", directory, i), header = T, na.strings = c("NA", "NaN", " ")))
        }
        
        ## calculate the mean excluding NAs
        mean(pmdata[[pollutant]], na.rm = T) 
        
}
