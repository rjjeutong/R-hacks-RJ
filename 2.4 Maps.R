library(tidyverse)

sqrt(100)

1:10 %>% 
  map(.x = ., .f = sqrt)

1:10 %>% 
  map_dbl(.x = ., .f = sqrt)
1:10 %>% 
  map_dbl(sqrt)

1:10 %>% 
  map_chr(sqrt)

1:10 %>% map_int(sqrt)

map_df()

list.files(path = 'Zip files/')
weather_data <- list.files(path = 'Zip files/', pattern = '.csv$', full.names = T) %>% 
  map_df(.x = ., .f = read_csv, col_names = F, n_max = 100000)

weather_data2 <- list.files(path = 'Zip files/', pattern = '.csv$', full.names = T) %>% 
  map_df(~ read_csv(file = ., col_names = F, n_max = 100000))


rnorm(n = 100, mean = 5, sd = 3)

1:10 %>% 
  map(rnorm, n=20)

1:10 %>% 
  map(~ rnorm(n = 20, mean = 5, sd = 1)) %>% 
  map_dbl(mean) 

1:10 %>% 
  map(~ rnorm(n = 1000, mean = ., sd = 1)) %>% 
  map_dbl(mean) 
  
1:10 %>% 
  map(~ rnorm(n = 1000, mean = 5, sd = .)) %>% 
  map_dbl(sd) 
