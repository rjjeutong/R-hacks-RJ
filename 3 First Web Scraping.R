#install.packages("rvest")

library(rvest)
library(tidyverse)

u <- "https://www.imdb.com/chart/moviemeter/?sort=nv,desc&mode=simple&page=1"

page <- read_html(x = u)

title <- page %>% 
  html_nodes(".titleColumn a") %>% 
  html_text(trim = T)

year <- page %>% 
  html_nodes("a+ .secondaryInfo") %>% 
  html_text(trim = T) %>% 
  parse_number()

ratings <- page %>% 
  html_nodes("strong") %>% 
  html_text(trim = T) %>% 
  parse_number()

n_missing <- length(title) - length(ratings)
rep(x = NA, n_missing)

ratings <- c(ratings, rep(x = NA, n_missing))

links <- page %>% 
  html_nodes(".titleColumn a") %>% 
  html_attr('href')

links <- paste0("www.imdb.com", links)

dat <- tibble(title, year, ratings, link = links)

dat %>% 
  filter(year == 2019, ratings >=8.5)
