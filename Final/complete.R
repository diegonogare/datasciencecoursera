complete <- function(directory, id = 1:332) {

  source("loadFiles.R")
  
  lst <- loadFiles(directory, id)
  
  m <- matrix(ncol = 2,nrow = length(lst))
  colnames(m) <- c("id","nobs")
  rownames(m) <- 1:length(lst)
  
  for(i in 1:length(lst))
  {
    m[i,1] <- id[i]
    result <- lst[[i]][!is.na(lst[[i]][,"nitrate"]) & !is.na(lst[[i]][,"sulfate"]),]
    m[i,2] <- nrow(result)
  }
  
  data.frame(m)
}