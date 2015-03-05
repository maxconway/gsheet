google_sheet2text <- function(link, format='csv'){
  key <- link %>% str_extract('/[[:alnum:]_-]{30,}/') %>% str_replace_all('/','')
  address <- paste0('https://spreadsheets.google.com/feeds/download/spreadsheets/Export?key=',key,'&exportFormat=',format)
  page <- html('https://spreadsheets.google.com/feeds/download/spreadsheets/Export?key=1fyS4_Qoufdfy6kty5_qxuIDuvClIomn6E542vGwSF0Y&exportFormat=csv')
  content <- page %>% html_node('p') %>% html_text()
  return(content)
}