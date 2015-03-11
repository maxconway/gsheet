library(gsheet)
context('Test gsheet2text')

test_that('Works correctly with and without sheet id', {
  a <- gsheet2text('docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo')
  b <- gsheet2text('docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo', sheetid=0)
  expect_equal(a, b)
})

test_that('Throws informative error when share by link is turned off', {
  expect_error({gsheet2text('https://docs.google.com/spreadsheets/d/1zMvLM_dWvIHeTFi8Sct9QMmrr7Roo2tav2SE4Wt7vBQ/edit')},
               "Unable to retrieve document. Is 'share by link' enabled for this sheet?"
               )
})