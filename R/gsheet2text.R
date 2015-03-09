#' Download Google sheet as text.
#' 
#' Downloads a Google sheet as text, using just the url.
#' The Google sheet must have 'share by link' turned on.
#' 
#' \code{sheetid} is zero based, so normally \code{sheetid=0} will download the first sheet. 
#' However, deleted sheets do not relinquish their \code{sheetid}, so if you create two sheets, then delete the first one, there will be no sheet 0, and the new first sheet will be sheet 1.
#' 
#' @param url the google sheet url
#' @param format controls the column separator used. \code{csv} or \code{tsv}
#' @param sheetid the (zero based) id of the sheet to download from.  (Default \code{NULL}, downloads the first sheet)
#' 
#' @seealso \code{\link{gsheet2text}} to download as a table
#' @export
#' 
#' @examples
#' 
#' url <- 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'
#' a <- gsheet2text(url)
#' b <- read.csv(text=a)
#' 
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