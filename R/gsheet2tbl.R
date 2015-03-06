#' Download Google sheet as a table
#' 
#' \code{sheet2tbl} wraps \code{sheet2text} to parse sheets to tables.
#' 
#' \code{sheetid} is zero based, so normally \code{sheetid=0} will download the first sheet. 
#' However, deleted sheets do not relinquish their \code{sheetid}, so if you create two sheets, then delete the first one, there will be no sheet 0, and the new first sheet will be sheet 1.
#' 
#' If this function produces unexpected results, use a construction like \code{read.csv(text=google_sheet2text(url, format='csv'), stringsAsFactors=FALSE)} to parse manually, with your own options. 
#' The Google sheet must have 'share by link' turned on.
#' 
#' @param url the google sheet url
#' @param sheetid the (zero based) id of the sheet to download from. (Default \code{NULL}, downloads the first sheet)
#' 
#' @seealso \code{\link{gsheet2text}} to download as plain text
#' @export
#' 
#' @examples
#' \dontrun{
#' # Download a sheet
#' url <- 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'
#' a <- gsheet2tbl(url)
#' 
#' # Download the same sheet by id
#' b <- gsheet2tbl(url, sheetid = 0)
#' }
gsheet2tbl <- function(url, sheetid=NULL){
  dplyr::tbl_df(read.csv(text=gsheet::gsheet2text(url, format='csv', sheetid=sheetid), stringsAsFactors=FALSE))
}