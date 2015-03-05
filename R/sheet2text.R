google_sheet2text <- function(url, format='csv'){
  key <- url %>% stringr::str_extract('/[[:alnum:]_-]{30,}/') %>% stringr::str_replace_all('/','')
  address <- paste0('https://spreadsheets.google.com/feeds/download/spreadsheets/Export?key=',key,'&exportFormat=',format)
  page <- rvest::html('https://spreadsheets.google.com/feeds/download/spreadsheets/Export?key=1fyS4_Qoufdfy6kty5_qxuIDuvClIomn6E542vGwSF0Y&exportFormat=csv')
  content <- page %>% rvest::html_node('p') %>% rvest::html_text()
  return(content)
}