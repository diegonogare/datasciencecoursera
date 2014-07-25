pollutantmean <- function(directory, pollutant, id = 1:332) {
 
  loadFiles <- dget("loadFiles.R")
  
  lst <- loadFiles(directory, id, pollutant)
  
  values <- unlist(lst)
  values[which(c(1,diff(values)) != 0)]
  
  mean(values, na.rm = TRUE)
}
