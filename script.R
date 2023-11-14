#Load library
library(tidyverse)
library(rvest)

# declare XML sitemap url
url <- 'https://www.ismeamercati.it/flex/cm/pages/ServeBLOB.php/L/IT/IDPagina/2078'


date_month <- url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="MITable7"]/thead/tr/th[2]')%>% 
  html_text(trim=TRUE)

price <- url %>%
  read_html() %>%
  html_nodes(xpath='//*[@id="MITable7"]/tbody/tr[2]/td[1]')%>% 
  html_text(trim=TRUE)
  


# create a new row of data, with todayd's date and urls number
row <- data.frame(Sys.Date(), date_month, price)

# append at the end of the csv the new data
write_csv(row,paste0('data/ISMEALatte.csv'),append = T)  