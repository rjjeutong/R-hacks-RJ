#1
library(tidyverse)

#2
path_func <- function(x){
  dir.create(path = paste0('Weather/', x))
}

path_func(2013)
path_func(2014)

2013:2016 %>% walk(path_func)

#3
list.files(path = 'Zip files/Excersise Data/', pattern = '.csv$', full.names = T)
list.files('Weather/', full.names = T)

read_n_write <- function(x){
  read_csv(file = paste0("Zip files/Excersise Data/", x, ".csv"), col_names = F, n_max = 100000) %>% 
    write_csv(x = ., path = paste0("Weather/", x, "/", x, ".csv"))
}

read_n_write(2013)

#4
2013:2016 %>% walk(read_n_write)

#5
rm_func <- function(x){
  file.remove(paste0("Weather/", x, "/", x, ".csv"))
}
2013:2016 %>% walk(rm_func)

#6
copy_paste <- function(x) {
  file.copy(from = paste0("Zip files/Excersise Data/", x, ".csv"),
            to = paste0("Weather/", x, "/", x, ".csv"))
}
#7
2013:2016 %>% walk(copy_paste)


