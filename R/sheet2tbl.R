google_sheet2tbl <- function(url){
  google_sheet2text(url, format='csv') %>% read.csv(text=., stringsAsFactors=FALSE) %>% tbl_df()
}