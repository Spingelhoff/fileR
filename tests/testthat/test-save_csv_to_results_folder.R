test_that("data is saved correctly", {
  test <- "test"
  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      save_csv_to_results_folder(test, "test", "test")
      read.csv("results/test/test.csv")
    }),
    data.frame(X = 1, x = "test")
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
