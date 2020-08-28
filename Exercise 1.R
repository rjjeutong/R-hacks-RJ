install.packages('tidyverse')
install.packages('lubridate')

lubridate::date()
lubridate::today()

lubridate::month(lubridate::today())

library(lubridate)
date()
today()
month(today())


library(tidyverse)
#library(purrr)
#%>% 


filter()
dplyr::filter()

d <- '2011-12-12'
d
d2 <- ymd(d)
d2
class(d)
class(d2)

Sys.Date()

Sys.sleep(20)
