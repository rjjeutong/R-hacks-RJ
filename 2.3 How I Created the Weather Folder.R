
library(tidyverse)

file.remove('Weather')
unlink(x = 'Weather', recursive = T)


dir.create(path = "Weather")

x <- 2019
paste0('Weather/', x)
rm(x)

path_func <- function(x){
  
  dir.create(path = paste0('Weather/', x))
}

path_func(2020)
path_func('test')


unlink(x = 'Weather', recursive = T)

2017:2020 %>% walk(.x = ., .f = path_func)

read_csv(file = 'Zip files/2017.csv', col_names = F, n_max = 200000)
write_csv(x = , path = )

read_csv(file = 'Zip files/2017.csv', col_names = F, n_max = 200000) %>% 
  write_csv(x = ., path = 'Weather/2017/2017.csv')

read_n_write <- function(x){
  read_csv(file = paste0('Zip files/', x, '.csv'), col_names = F, n_max = 200000) %>% 
    write_csv(x = ., path = paste0('Weather/',x,'/',x,'.csv'))
}

read_n_write(2018)

2017:2020 %>% 
  walk(.x = ., .f = read_n_write)


