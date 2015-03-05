sheet2text <- function(url, format='csv'){
  key <- stringr::stringr::str_replace_all(stringr::str_extract(url, '/[[:alnum:]_-]{30,}/'), '/','')
  address <- paste0('https://spreadsheets.google.com/feeds/download/spreadsheets/Export?key=',key,'&exportFormat=',format)
  page <- rvest::html('https://spreadsheets.google.com/feeds/download/spreadsheets/Export?key=1fyS4_Qoufdfy6kty5_qxuIDuvClIomn6E542vGwSF0Y&exportFormat=csv')
  content <- rvest::html_text(rvest::html_node(page, 'p'))
  return(content)
}