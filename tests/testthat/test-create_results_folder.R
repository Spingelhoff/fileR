test_that("folder creation works", {
  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      create_results_folder("folder")
      list.files("./results")
    }),
    "folder"
  )
})

test_that("checks are performed for results and data directories", {
  expect_error(
    withr::with_tempdir({
      dir.create("results")
      create_results_folder("folder")
    })
  )
})

test_that("checks are performed against pre-existing folders", {
  expect_warning(
    withr::with_tempdir({
      setup_fileR_directories()
      dir.create("./results/folder")
      create_results_folder("folder")
    })
  )
})
