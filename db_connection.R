# Retrieve today's observations from the gen_by_fuel series
library(data.table); library(httr); library(lubridate)

r <- GET("https://api.pjm.com/api/v1/gen_by_fuel", add_headers("Ocp-Apim-Subscription-Key" = "625845c6fabc4639ab91428486d8d2e2"),
         query = list(rowCount = "40000", startRow = "1", datetime_beginning_ept = 'Today'))

temp = httr::content(r,"parsed")

gen_data_today = data.table::rbindlist(temp[['items']])

print(head(gen_data_today))