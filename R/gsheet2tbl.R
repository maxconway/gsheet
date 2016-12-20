#' Download Google sheet as a table
#' 
#' This is a convenience function, designed to download a table quickly and conveniently.
#' If you experience any unexpected results, or you want more reliability or control (e.g. for a production situation), then I'd recommend you parse manually using one of the constructions in the examples:
#' \itemize{
#'   \item{\code{read.csv(text=gsheet2text(url, format='csv'), stringsAsFactors=FALSE)}}
#'   \item{\code{}}
#' }
#' 
#' @details 
#' The Google sheet must have 'share by link' turned on.
#' 
#' If the package \code{readr} is available, then it will be used. 
#' This can produce slightly different, but normally better, parsings.
#' 
#' 
#' @param url the google sheet url
#' @param sheetid the index of the sheet to be downloaded. If you use the direct sheet URL, rather than the share by link, this will automatically be extracted. 
#' Otherwise, the first sheet will be downloaded by default.
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
#' # To download a sheet with more control, use the following:
#' url <- 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'
#' read.csv(text=gsheet2text(url, format='csv'), stringsAsFactors=FALSE)
#' 
#' # Or, with readr:
#' if(requireNamespace('readr', quietly=TRUE)){
#'   library(readr)
#'   read_csv(construct_download_url(url), col_types = cols(
#'     mpg = col_double(),
#'     cyl = col_integer(),
#'     disp = col_double(),
#'     hp = col_integer(),
#'     drat = col_double(),
#'     wt = col_double(),
#'     qsec = col_double(),
#'     vs = col_integer(),
#'     am = col_integer(),
#'     gear = col_integer(),
#'     carb = col_integer()
#'   ))
#' }
#' 
gsheet2tbl <- function(url, sheetid = NULL){
  if(requireNamespace('readr', quietly=TRUE)){
    suppressMessages(table <- readr::read_csv(file = construct_download_url(url, format='csv', sheetid = NULL)))
  }else{
    table <- utils::read.csv(text=gsheet2text(url=url, format='csv', sheetid=sheetid), stringsAsFactors=FALSE)
    class(table) <- c("tbl_df", "tbl", "data.frame")
  }
  return(table)
}