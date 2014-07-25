#setwd("C:\\Users\\diego.nogare\\datasciencecoursera\\ProgramingR\\Final")


loadFiles <- function(directory, id, pollutant = NULL)
{
  lst <- vector("list",length = length(id))
  
  for(i in 1:length(id))
  {
    filename <- if(id[i]>99) {
      as(id[i],Class = "character")
    }
    else if(id[i]>9 & id[i]<100)
    {
      paste("0",as(id[i],Class = "character"),sep = "")
    }
    else
    {
      paste("00",as(id[i],Class = "character"), sep = "")
    }
    
    path <- paste(getwd(),"/",directory,"/",filename,".csv",sep = "")
    
    data <- read.csv(file = path)
    if(is.null(pollutant))
      lst[[i]] <- data
    else
      lst[[i]] <- data[,pollutant]
  }
  lst
}