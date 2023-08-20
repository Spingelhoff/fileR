test_that("creation of data directories is correct", {
  expect_true(
    withr::with_tempdir({
      setup_fileR_directories()
      dir.exists("data")
    })
  )
})

test_that("creation of results directories is correct", {
  expect_true(
    withr::with_tempdir({
      setup_fileR_directories()
      dir.exists("results")
    })
  )
})

test_that("creation of library setup file is correct", {
  expect_true(
    withr::with_tempdir({
      setup_fileR_directories(setup = TRUE)
      file.exists("library_setup.R")
    })
  )
})

test_that("creation of directory setup file is correct", {
  expect_true(
    withr::with_tempdir({
      setup_fileR_directories(setup = TRUE)
      file.exists("directory_setup.R")
    })
  )
})

test_that("creation of directory setup file can be turned off", {
  expect_false(
    withr::with_tempdir({
      setup_fileR_directories(setup = FALSE)
      file.exists("directory_setup.R")
    })
  )
})

test_that("correct lines are written to library setup file", {
  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories(setup = TRUE)
      readLines("library_setup.R")
    }),
    "library(fileR)"
  )
})

test_that("correct lines are written to directory setup file", {
  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories(setup = TRUE)
      readLines("directory_setup.R")
    }),
    c("source(\"library_setup.R\")", "setup_fileR_directories()")
  )
})
