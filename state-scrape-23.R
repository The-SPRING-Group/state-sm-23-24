library(tidyverse)
library(rvest)

page <- read_html("https://www.ncsl.org/technology-and-communication/social-media-and-children-2023-legislation")

jurisdictions <- page |>
  html_elements("td:nth-child(1)") |>
  html_text()

bill_numbers <- page |> 
  html_elements("td:nth-child(2)") |> 
  html_text()

titles <- page |> 
  html_elements("td:nth-child(3)") |> 
  html_text()

bill_statuses <- page |> 
  html_elements("td:nth-child(4)") |> 
  html_text()

summaries <- page |> 
  html_elements("td:nth-child(5)") |> 
  html_text()

## Create Data Frame

state_2023_raw <- tibble(
  state = jurisdictions,
  bill_number = bill_numbers,
  title = titles,
  bill_status = bill_statuses,
  summary = summaries
)

## Write Csv

write_csv(state_2023_raw, file = "data/state-2023-bills.csv")