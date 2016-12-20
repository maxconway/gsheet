library(gsheet)
context('Test gsheet2tbl')

test_that('Correct result on mtcars sheet', {
  suppressWarnings(a <- gsheet2tbl('docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'))
  expect_true(all(a==mtcars))
})

test_that('Works correctly with and with url containing sheetid = 850032961', {
  suppressWarnings(a <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo/edit#gid=850032961'))
  expect_equal(unlist(a), unlist(mtcars[1,]))
})

test_that('Correct result on corner cases sheet', {
  a <- gsheet2tbl('https://docs.google.com/spreadsheets/d/1QNaOSRePfMRpdyR6DQfdO82pAq9RRrlJeK6DP3ZlMCg/edit?usp=sharing')
  expect_equal(a[1,'case'] %>% as.character(),'<test>hello')
})