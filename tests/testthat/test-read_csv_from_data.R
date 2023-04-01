test_that("data can be read from the data directory", {
  test <- "test"
  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      write.csv(test, "./data/test.csv")
      as.data.frame(read_csv_from_data("test"))[[2]]
    }),
    "test"
  )
})

test_that("data can be read from the data directory folder", {
  test <- "test"
  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      create_data_folder("folder")
      write.csv(test, "./data/folder/test.csv")
      as.data.frame(read_csv_from_data("test", folder_name = "folder"))[[2]]
    }),
    "test"
  )
})
