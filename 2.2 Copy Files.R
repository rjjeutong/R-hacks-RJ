
list.files(path = 'Weather/2017/', full.names = T)
from_path <- list.files(path = 'Weather/2017/', full.names = T)

file.copy(from = from_path, to = 'Weather')

"Weather/2017/2017.csv"
"Weather/2018/2018.csv"

y <- 2017:2020
paste0("Weather/", y, "/",y, ".csv")

my_copy_function <- function(x) {
  from_path <- paste0("Weather/", x, "/",x, ".csv")
  file.copy(from = from_path, to = 'Weather')
}

my_copy_function(2020)

for (i in 2017:2020) {
  my_copy_function(i)
}

library(tidyverse)
walk(.x = 2017:2020, .f = safely(my_copy_function))

