m_average <- function(file, fs=10)
{
 my.data <- data.frame(read.csv(file, header = TRUE))
 ro <- length(my.data[,1])
 my.mean <- data.frame(matrix(NA, nrow = ro-fs, ncol = 1)) 
 for (m in seq(1, ro-fs, by=1)){
  my.mean[m,1] <- mean(my.data[m, 6]:my.data[m+fs-1, 6]) 
  #skajksjaksja  
  }      
 write.csv(my.mean, "C:/Users/Victor/Dropbox/University of Strathclyde/Summer Project/Data/APD.csv")
 return(my.mean)
 #return("APD.csv saved at C:/Users/Victor/Dropbox/University of Strathclyde/Summer Project/Data/APD.csv")
}