corr <- function(directory, threshold = 0)
{
  source("complete.R")
  df <- complete(directory)
  id <- df[df$nobs>threshold,]$id
  
  if(length(id)>0)
  {
    source("loadFiles.R")
    lst <- loadFiles(directory, id)
    
    v <- vector("numeric",length(lst))
    
    for(i in 1:length(lst)){
      v[i] <- cor(lst[[i]]$nitrate, lst[[i]]$sulfate, use="complete.obs")
    }
    
    v
  }
  else
  {
    v <- vector("numeric")
    v
  }
}
