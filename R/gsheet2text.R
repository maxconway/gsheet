#' Download Google sheet as text.
#' 
#' Downloads a Google sheet as text, using just the url.
#' The Google sheet must have 'share by link' turned on.
#' 
#' @param url the google sheet url
#' @param format controls the column separator used. \code{csv} or \code{tsv}
#' 
#' @seealso \code{\link{gsheet2text}} to download as a table
#' @export
#' 
#' @examples
#' \dontrun{
#' url <- 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'
#' a <- gsheet2text(url)
#' b <- read.csv(a)
#' }
gsheet2text <- function(url, format='csv', sheetid = NULL){
  key <- stringr::str_extract(url, '[[:alnum:]_-]{30,}')
  address <- paste0('https://spreadsheets.google.com/feeds/download/spreadsheets/Export?key=',key,'&exportFormat=',format)
  if(!is.null(sheetid)){
    address <- paste0(address, '&gid=', sheetid)
  }
  page <- rvest::html(address)
  content <- rvest::html_text(rvest::html_node(page, 'p'))
  return(content)
}