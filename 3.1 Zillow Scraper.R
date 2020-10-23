
library(tidyverse)
library(rvest)

u <- 'https://www.zillow.com/homes/for_sale/20744_rb/'

pg <- read_html(u)

price <- pg %>% 
  html_nodes('.list-card-price') %>% 
  html_text(trim = T) %>% 
  tolower() %>% 
  str_replace_all(string = ., pattern = '[,|$|\\s|-]', replacement = '') %>% 
  as.numeric()


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

################################################################

pg %>% 
  html_nodes('.kdxFbt a') %>% 
  html_attr('href')

links <- paste0('https://www.zillow.com/fort-washington-md-20744/',1:5,'_p')


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

my_scraper(links[2])

dat <- links %>% 
  map_df(.x = ., .f = my_scraper)


