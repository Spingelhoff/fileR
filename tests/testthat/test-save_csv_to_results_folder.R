test_that("data is saved correctly", {
  test <- "test"
  test_df <- data.frame(X = 1, x = "test")
  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      save_csv_to_results_folder(test, "test", "test")
      read.csv("results/test/test.csv")
    }),
    test_df
  )
})

test_that("object passed in is returned invisibly", {
  test <- "test"
  expect_invisible(
    withr::with_tempdir({
      setup_fileR_directories()
      save_csv_to_results_folder(test, "test", "test")
    })
  )
})

test_that("object returned is not altered", {
  test <- "test"
  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      save_csv_to_results_folder(test, "test", "test")
    }),
    test
  )
})
