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
#' 
#' @examples
#' 
#' url <- 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'
#' a <- gsheet2text(url)
#' b <- read.csv(text=a)
#' 
gsheet2text <- function(url, format='csv', sheetid = NULL){
  address <- construct_download_url(url=url, format=format, sheetid = sheetid)
  page <- httr::GET(address)
  if(stringr::str_detect(page$headers$`content-type`, stringr::fixed('text/html'))){
    stop("Unable to retrieve document. Is 'share by link' enabled for this sheet?")
  }
  content <- httr::content(page, as='text')
  return(content)
}