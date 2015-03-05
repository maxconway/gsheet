#' Download Google sheet as a table
#' 
#' \code{sheet2tbl} wraps \code{sheet2text} to parse sheets to tables.
#' If this function produces unexpected results, use a construction like \code{read.csv(text=google_sheet2text(url, format='csv'), stringsAsFactors=FALSE)} to parse manually, with your own options. 
#' The Google sheet must have 'share by link' turned on.
#' 
#' @param url the google sheet url
#' 
#' @family gsheet functions
sheet2tbl <- function(url){
  dplyr::tbl_df(read.csv(text=google_sheet2text(url, format='csv'), stringsAsFactors=FALSE))
}