# Primeira parte - Carregar dados
setwd("D:/R/ProgramingR")
fileurl ="https://d396qusza40orc.cloudfront.net/rprog%2Fdata%2Fspecdata.zip"
download.file(fileurl, "./spec.zip")
unzip("./spec.zip")


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