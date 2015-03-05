sheet2tbl <- function(url){
  dplyr::tbl_df(read.csv(google_sheet2text(url, format='csv'), text=., stringsAsFactors=FALSE))
}