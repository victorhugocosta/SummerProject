edges <- function(file)
# function that receive the file with edges from Matlab, and return one file
# with the periods identified as rumination (~40 seconds)
{
  my.data.original <- read.csv(file, header = FALSE)
  my.data <- as.numeric(unlist(my.data.original))

  ro <- length(my.data)
  gaps <- list()		#used to find the correct location of edges

  periods <- list()	#used to determine the periods between each edge
  
  location <- list()	#used to determine the periods of each rumination (or not) block
  #must be something around 40s  (400 samples / 10Hz)

  for (m in seq(1, ro, by=1))
  {
    if(my.data[[m]] > 0)
    {
      gaps <- append(gaps, m)
    }
  }

  for (n in seq(1:(length(gaps)-1)))
  {
    periods <- append(periods, gaps[[n+1]]-gaps[[n]])
  }

  for (p in seq(1:(length(gaps)-1)))
  {
    if( ( (gaps[[p+1]]-gaps[[p]]) > 300) & (gaps[[p+1]]-gaps[[p]]) < 550)
    {
      location <- append(location, gaps[[p]])
      location <- append(location, gaps[[p+1]])
    }
  }

  output <- matrix(unlist(location), ncol = 2, byrow = TRUE)

  #write.csv(gaps, "C:/Users/Victor/Dropbox/University of Strathclyde/Summer Project/Data/gaps.csv")
  #write.csv(periods, "C:/Users/Victor/Dropbox/University of Strathclyde/Summer Project/Data/periods.csv")      
  write.csv(output, "C:/Users/Victor/Dropbox/University of Strathclyde/Summer Project/Data/location.csv")      

  #return(output)
  return("File saved")
}
