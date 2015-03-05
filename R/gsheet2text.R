#' Download Google sheet as text.
#' 
#' Downloads a Google sheet as text, using just the url.
#' The Google sheet must have 'share by link' turned on.
#' 
#' @param url the google sheet url
#' @param format controls the column separator used. \code{csv} or \code{tsv}
#' 
#' @family gsheet functions
#' @export
gsheet2text <- function(url, format='csv'){
  key <- str_extract(url, '[[:alnum:]_-]{30,}')
  address <- paste0('https://spreadsheets.google.com/feeds/download/spreadsheets/Export?key=',key,'&exportFormat=',format)
  page <- rvest::html(address)
  content <- rvest::html_text(rvest::html_node(page, 'p'))
  return(content)
}