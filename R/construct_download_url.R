#' Construct a google sheet download url from the sheet's viewing url
#' 
#' Converts the viewing url for a google sheet to a download url.
#' 
#' @param url the google sheet url
#' @param format controls the column separator used. \code{csv} or \code{tsv}
#' @param sheetid the id of the sheet to download from.  (Default \code{NULL}, downloads the first sheet)
#' 
#' @export
#' 
#' @examples 
#' 
#' # Download a sheet manually using readr
#' url <- 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'
#' 
#' if(requireNamespace('readr')){
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
construct_download_url <- function(url, format='csv', sheetid = NULL){
  key <- stringr::str_extract(url, '[[:alnum:]_-]{30,}')
  if(is.null(sheetid) & stringr::str_detect(url, 'gid=[[:digit:]]+')){
    sheetid <- as.numeric(stringr::str_extract(stringr::str_extract(url,'gid=[[:digit:]]+'),'[[:digit:]]+'))
  }
  address <- paste0('https://docs.google.com/spreadsheets/export?id=',key,'&format=',format)
  if(!is.null(sheetid)){
    address <- paste0(address, '&gid=', sheetid)
  }
  return(address)
}