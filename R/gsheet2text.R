#' Download Google sheet as text.
#' 
#' Downloads a Google sheet as text, using just the url.
#' The Google sheet must have 'share by link' turned on.
#' 
#' \code{sheetid} is the index of the sheet to be downloaded. 
#' If you use the direct sheet URL, rather than the share by link, this will automatically be extracted. 
#' Otherwise, the first sheet will be downloaded by default.
#' 
#' @param url the google sheet url
#' @param format controls the column separator used. \code{csv} or \code{tsv}
#' @param sheetid the id of the sheet to download from.  (Default \code{NULL}, downloads the first sheet)
#' 
#' @seealso \code{\link{gsheet2text}} to download as a table
#' @export
#' 
#' @import magrittr
#' 
#' @examples
#' 
#' url <- 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'
#' a <- gsheet2text(url)
#' b <- read.csv(text=a)
#' 
gsheet2text <- function(url, format='csv', sheetid = NULL){
  key <- stringr::str_extract(url, '[[:alnum:]_-]{30,}')
  if(is.null(sheetid) & stringr::str_detect(url, 'gid=[[:digit:]]+')){
    sheetid <- url %>% stringr::str_extract('gid=[[:digit:]]+') %>% stringr::str_extract('[[:digit:]]+') %>% as.numeric()
  }
  address <- paste0('https://docs.google.com/spreadsheets/export?id=',key,'&format=',format)
  if(!is.null(sheetid)){
    address <- paste0(address, '&gid=', sheetid)
  }
  page <- httr::GET(address)
  if(stringr::str_detect(page$headers$`content-type`, stringr::fixed('text/html'))){
    stop("Unable to retrieve document. Is 'share by link' enabled for this sheet?")
  }
  content <- page %>% 
    httr::content(as='text')
  return(content)
}