test_that("data directory is accessible", {
  expect_no_error(
    withr::with_tempdir({
      dir.create("data")
      list_data_files()
    })
  )
})

test_that("only directory named data is accessible", {
  expect_error(
    withr::with_tempdir({
      dir.create("not-data")
      list_data_files(folder_name = "data")
    })
  )
})
