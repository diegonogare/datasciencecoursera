# Primeira parte - Carregar dados
setwd("D:/R/ProgramingR")
fileurl ="https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(fileurl, "./spec.zip")
unzip("./spec.zip")


###### Exercício 1

# Função que retorna um data frame
MyFileName <- function(directory, nFile) {
  if (nFile < 10) { 
    filename <- paste("./",directory,"/00",nFile,".csv",sep="")
  } else if (nFile >= 10 & nFile < 100) {
    filename <- paste("./",directory,"/0",nFile,".csv",sep="")
  } else {
    filename <- paste("./",directory,"/",nFile,".csv",sep="")
  }
  myFile <- read.csv(file=filename,header=TRUE)
  return(myFile)  
}

# exemplo de append do arquivo com base no data frame
data <- rbind(data,MyFileName("specdata",10))

# Preencher no loop de 1 ate 332 os itens em um unico DataFrame
id = 1:332
  for (i in seq_along(id)) {
    data <- rbind(data,MyFileName("specdata",i))
  }


#função que recebe o diretório, tipo de poluente e o range
pollutantmean <- function(directory, pollutant, id) {
  
  if (pollutant == "sulfate"){
    retorno <- mean(data[id,2],na.rm=TRUE)    
  }
  else if (pollutant == "nitrate"){
    retorno <- mean(data[id,3],na.rm=TRUE)    
  }
  return(retorno) 
}

#testar a função que recebe o diretório, tipo de poluente e o range
pollutantmean("specdata", "nitrate", 297)
pollutantmean("specdata", "sulfate", 297)

pollutantmean("specdata", "nitrate", 297:500)
pollutantmean("specdata", "sulfate", 297:500)

# remover os valores nulos, e fazer a mean das colunas Sulfate e Nitrate
sulfateMean = mean(data[,2],na.rm=TRUE) '3.189369'
nitrateMean = mean(data[,3],na.rm=TRUE) '1.702932'

###### Exercício 2

# Cria a função que retorna os casos completos
complete <- function(directory, id = 1:332) {
  completeData <- subset(data, ID %in% id)
  length(completeData[,4])
}

#testar a função que retorna os casos completos
complete("specdata", 30:25)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 3)

###### Exercício 3

corr <- function(directory, threshold = 0) {
  
cor(data$sulfate,data$nitrate)
cor(data[,2],data[,3])

}