test_that("data directory is accessible", {
  withr::local_tempdir(pattern = "testing_file", tmpdir = "data")
  expect_no_error(list_data_files())
})

test_that("only directory named data is accessible", {
  expect_error(withr::with_tempdir(list_data_files(), pattern = "testing_file", tempdir = "not-data"))
})
