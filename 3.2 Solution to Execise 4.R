
# steps 1 to 5
https://www.imdb.com/search/name/?gender=male%2Cfemale&ref_=nv_cel_m
https://www.imdb.com/search/name/?gender=male,female&start=51&ref_=rlm
https://www.imdb.com/search/name/?gender=male,female&start=101&ref_=rlm
https://www.imdb.com/search/name/?gender=male,female&start=151&ref_=rlm

#step 6
nseq <- seq(from=1, to = 600, by = 50)
links <- paste0('https://www.imdb.com/search/name/?gender=male,female&start=',nseq,'&ref_=rlm')


#8
.lister-item-header a

library(tidyverse)
library(rvest)

u <- links[1]
pg <- read_html(u)

actor <- pg %>% 
  html_nodes('.lister-item-header a') %>% 
  html_text(trim = T)

#9
about_actor <- pg %>% 
  html_nodes(".text-small+ p") %>% 
  html_text(trim = T)

#10
actor_link <- pg %>% 
  html_nodes('.lister-item-header a') %>% 
  html_attr('href')

actor_link <- paste0('https://www.imdb.com', actor_link)

#11
tibble(actor, about_actor, actor_link)

#12
my_actor_scraper <- function(x){
  
  Sys.sleep(sample(1:5, 1, T))
  
  cat('.')
  
  pg <- read_html(x)
  
  actor <- pg %>% 
    html_nodes('.lister-item-header a') %>% 
    html_text(trim = T)
  
   about_actor <- pg %>% 
    html_nodes(".text-small+ p") %>% 
    html_text(trim = T)
  
  actor_link <- pg %>% 
    html_nodes('.lister-item-header a') %>% 
    html_attr('href')
  
  actor_link <- paste0('https://www.imdb.com', actor_link)
  
  tibble(actor, about_actor, actor_link)
}

#13
my_actor_scraper(links[2])

#14
dat <- links %>% 
  map_df(.x = ., .f = my_actor_scraper)

#15
write_csv(x = dat, path = 'about_actors.csv')


#bonus

actor_image <- pg %>% 
  html_nodes('img') %>% 
  html_attr('src') %>% 
  subset(x = ., str_detect(string = ., pattern = '.jpg'))

download.file(url = actor_image[1], destfile = 'Actor1.jpg', mode = 'wb')
