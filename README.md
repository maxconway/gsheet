<!-- README.md is generated from README.Rmd. Please edit that file -->



# gsheet

gsheet is a simple package to download Google Sheets (aka Google Docs Spreadsheets) using just the sharing link. Sheets can be downloaded as a data frame, or as plain text to parse manually. 

## Installation
Install from CRAN with:

```r
install.packages('gsheet')
```

Or install the latest development version from github wth:

```r
devtools::install_github("maxconway/gsheet")
```

## Getting started
Download a google sheet as a table with:

```r
library(gsheet)
gsheet2tbl('docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo')
```

## Advanced
### More control
If you want more control, you might want to use something like:

```r
url <- 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'
a <- gsheet2text(url, format='csv')
b <- read.csv(a, stringsAsFactors=FALSE)
```
This way the table can be cleaned before parsing, and different options can be used in parsing.

### Downloading other sheets
If you want to download a sheet other than the first, you have to use the direct url, copied from the address bar, like so:

```r
url <- 'docs.google.com/spreadsheets/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo#gid=850032961'
b <- gsheet2tbl(url)
```
This works because this makes the gid, whcih si the sheet identifier, available.
If you have problems downloading the first sheet, this can also help too.



