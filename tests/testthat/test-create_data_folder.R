test_that("folder creation works", {
  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      create_data_folder("folder")
      list.files("./data")
    }),
    "folder"
  )
})

test_that("checks are performed for results and data directories", {
  expect_error(
    withr::with_tempdir({
      dir.create("data")
      create_data_folder("folder")
    })
  )
})

test_that("checks are performed against pre-existing folders", {
  expect_warning(
    withr::with_tempdir({
      setup_fileR_directories()
      dir.create("./data/folder")
      create_data_folder("folder")
    })
  )
})
