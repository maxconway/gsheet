library(gsheet)
context('Test gsheet2tbl')

test_that('Correct result on mtcars sheet', {
  a <- gsheet2tbl('docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo')
  expect_true(all(a[,2:12]==mtcars))
})

test_that('Works correctly with and without sheet id', {
  a <- gsheet2tbl('docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo')
  b <- gsheet2tbl('docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo', sheetid=0)
  expect_equal(a, b)
})