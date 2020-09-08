library(tidyverse)
library(R.utils)

list.files(path = 'Zip files/Excersise Data/', full.names = T)
myzipfiles <- list.files(path = 'Zip files/Excersise Data/', full.names = T)

for(k in 1:4) {
  print(myzipfiles[k])
  gunzip(myzipfiles[k], remove  = F)
}

file.remove("Zip files/Excersise Data/2013.csv")
rm_files <- list.files(path = 'Zip files/Excersise Data/', pattern = 'csv$', full.names = T)

walk(.x = rm_files, .f = file.remove)

myzipfiles
walk(.x = myzipfiles, .f = gunzip, remove  = F)

