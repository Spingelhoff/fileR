test_that("creation of directories is correct", {
  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
    }),
    withr::with_tempdir({
      dir.create("results")
      dir.create("data")
    })
  )
})
