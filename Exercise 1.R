install.packages('lubridate')

lubridate::date()
lubridate::today()

lubridate::month(lubridate::today())

library(lubridate)
date()
today()
month(x = today())
month(x = today(), label = T, abbr = F)

d <- '2011-12-12'
d2 <- ymd(d)
class(d)
class(d2)

Sys.Date()
Sys.sleep(10)

