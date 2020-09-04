library(R.utils)

install.packages('tidyverse')

library(tidyverse)
#library(purrr)

walk()

myzipfile <- list.files(path = 'Zip files/', pattern = 'gz', full.names = T)

rm(i)
rm(myzipfile)


walk(.x = myzipfile, .f = gunzip)

walk(.x = myzipfile, .f = gunzip, remove = F)

walk(.x = myzipfile, .f = safely(gunzip), remove = F)
