library(gsheet)
context('Test gsheet2text')

test_that('Works correctly with and without sheet id', {
  a <- gsheet2text('docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo')
  b <- gsheet2text('docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo', sheetid=0)
  expect_equal(a, b)
})