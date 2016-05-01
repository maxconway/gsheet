library(gsheet)
context('Test gsheet2tbl')

test_that('Correct result on mtcars sheet', {
  a <- gsheet2tbl('docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo')
  expect_true(all(a[,2:12]==mtcars))
})

test_that('Works correctly with and with url containing sheetid = 850032961', {
  a <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo/edit#gid=850032961')
  expect_equal(unlist(a[,-1]), unlist(mtcars[1,]))
})

test_that('Correct result on corner cases sheet', {
  a <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1QNaOSRePfMRpdyR6DQfdO82pAq9RRrlJeK6DP3ZlMCg/edit?usp=sharing')
  expect_equal(a[1,'case'],'<test>hello')
})