library(tidyverse)
library(rvest)
library(lubridate)

u <- 'https://www.zillow.com/homes/for_sale/20744_rb/'
pg <- read_html(u)

npages <- pg %>% 
  html_nodes('.brNokq .bTrxAR') %>% 
  html_text(trim = T) %>% 
  parse_number() %>% 
  max()

links <- paste0('https://www.zillow.com/fort-washington-md-20744/',1:npages,'_p')
links

cat('\n')

lk <- pg %>% 
  html_nodes('.brNokq .bTrxAR') %>% 
  html_attr('href')

links2 <- paste0('https://www.zillow.com',lk)

links
cat('\n')
links2

my_scraper <- function(x){
  
  Sys.sleep(time = sample(x = 7:12, size = 1, replace = T))
  pg <- read_html(x)
  
  price <- pg %>% 
    html_nodes('.list-card-price') %>% 
    html_text(trim = T) %>% 
    tolower() %>% 
    str_replace_all(string = ., pattern = '[,|$|\\s|-|k|est.]', replacement = '') %>% 
    parse_number()
  
  
  address <- pg %>% 
    html_nodes('.list-card-addr') %>% 
    html_text(trim = T)
  
  type <- pg %>% 
    html_nodes('.list-card-type') %>% 
    html_text(trim = T)
  
  item_link <- pg %>% 
    html_nodes('.list-card-info .list-card-link-top-margin') %>% 
    html_attr(x = ., name = 'href')
  
  tibble(address, price, type, item_link)
}

cat('\n')
cat('\n')

today()

dat <- links[2:3] %>% 
  map_df(.x = ., .f = my_scraper)

dat %>% write_csv(x = .,
                  path = paste0('C:/Users/rjeut/Documents/1 R Hacks/',lubridate::today(), '_MyZillowFile.csv'))

