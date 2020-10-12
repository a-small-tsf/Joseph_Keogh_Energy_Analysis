# Retrieve today's observations from the gen_by_fuel series
library(data.table); library(httr); library(lubridate)

pnode=34964545

r <- GET("https://api.pjm.com/api/v1/rt_unverified_fivemin_lmps", add_headers("Ocp-Apim-Subscription-Key" = "625845c6fabc4639ab91428486d8d2e2"),
         query = list(rowCount = 3000, startRow = "1", datetime_beginning_ept = 'CurrentWeek', pnode_id= pnode, sort='datetime_beginning_ept'))

temp = httr::content(r,"parsed")

gen_data_today = data.table::rbindlist(temp[['items']])

print(head(gen_data_today))

# Connect to the database
