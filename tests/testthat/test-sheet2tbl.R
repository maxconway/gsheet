library(gsheet)
context('Test sheet2tbl')

test_that('Correct result on mtcars sheet', {
  a <- sheet2tbl('https://docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo/edit?usp=sharing')
  expect_true(all(a[,2:12]==mtcars))
})