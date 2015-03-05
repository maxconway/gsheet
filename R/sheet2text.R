#' Download Google sheet as text.
#' 
#' Downloads a Google sheet as text, using just the url.
#' The Google sheet must have 'share by link' turned on.
#' 
#' @param url the google sheet url
#' @param format controls the column separator used. \code{csv} or \code{tsv}
#' 
#' @family gsheet functions
sheet2text <- function(url, format='csv'){
  key <- stringr::str_replace_all(stringr::str_extract(url, '/[[:alnum:]_-]{30,}/'), '/','')
  address <- paste0('https://spreadsheets.google.com/feeds/download/spreadsheets/Export?key=',key,'&exportFormat=',format)
  page <- rvest::html('https://spreadsheets.google.com/feeds/download/spreadsheets/Export?key=1fyS4_Qoufdfy6kty5_qxuIDuvClIomn6E542vGwSF0Y&exportFormat=csv')
  content <- rvest::html_text(rvest::html_node(page, 'p'))
  return(content)
}