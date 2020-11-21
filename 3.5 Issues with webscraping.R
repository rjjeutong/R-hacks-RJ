library(tidyverse)
library(rvest)

u <- 'https://www.amazon.com/s?k=iphone&ref=nb_sb_noss_2'
pg <- read_html(u)

iphone <- pg %>% 
  html_nodes('.a-size-medium.a-text-normal') %>% 
  html_text(trim = T)

price_whole <- pg %>% 
  html_nodes('.sg-col-20-of-28 .a-price-whole') %>% 
  html_text(trim = T)

c(price_whole[1:3],NA,price_whole[4:21])
