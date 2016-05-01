#' Download Google sheet as a table
#' 
#' \code{sheet2tbl} wraps \code{sheet2text} to parse sheets to tables.
#' 
#' \code{sheetid} is the index of the sheet to be downloaded. If you use the direct sheet URL, rather than the share by link, this will automatically be extracted. 
#' Otherwise, the first sheet will be downloaded by default.
#' 
#' If this function produces unexpected results, use a construction like \code{read.csv(text=google_sheet2text(url, format='csv'), stringsAsFactors=FALSE)} to parse manually, with your own options. 
#' The Google sheet must have 'share by link' turned on.
#' 
#' @param url the google sheet url
#' 
#' @seealso \code{\link{gsheet2text}} to download as plain text
#' @export
#' 
#' @examples
#' 
#' # Download a sheet
#' url <- 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'
#' a <- gsheet2tbl(url)
#' 
#' # Download the second sheet, using the direct url
#' url <- 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo#gid=850032961'
#' b <- gsheet2tbl(url)
#' 
gsheet2tbl <- function(url){
  table <- utils::read.csv(text=gsheet2text(url, format='csv'), stringsAsFactors=FALSE)
  class(table) <- c("tbl_df", "tbl", "data.frame")
  return(table)
}