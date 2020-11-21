#install.packages('taskscheduleR')

library(taskscheduleR)

taskscheduler_create(taskname = 'MyzillowScheduler',
                     rscript = 'C:/Users/rjeut/Documents/1 R Hacks/3.3 Scheduler File.R',
                     schedule = 'WEEKLY',
                     starttime = '07:06',
                     startdate = '11/19/2020',
                     days = c('THU', 'FRI'))

taskscheduler_delete(taskname = 'MyzillowScheduler')

