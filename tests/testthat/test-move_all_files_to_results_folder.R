test_that("files are transferred", {
  a <- "a"
  b <- "b"
  c <- "c"

  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      dir.create("./results/from1")
      dir.create("./results/from2")
      dir.create("./results/to")
      write.csv(a, "./results/from1/a.csv")
      write.csv(b, "./results/from2/b.csv")
      write.csv(c, "./results/from2/c.csv")
      move_all_files_to_results_folder(to = "to")
      list.files("./results/to/")
    }),
    withr::with_tempdir({
      setup_fileR_directories()
      dir.create("./results/to")
      write.csv(a, "./results/to/a.csv")
      write.csv(b, "./results/to/b.csv")
      write.csv(c, "./results/to/c.csv")
      list.files("./results/to/")
    })
  )
})

test_that("original files are deleted", {
  a <- "a"
  b <- "b"
  c <- "c"

  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      dir.create("./results/from1")
      dir.create("./results/from2")
      dir.create("./results/to")
      write.csv(a, "./results/from1/a.csv")
      write.csv(b, "./results/from2/b.csv")
      write.csv(c, "./results/from2/c.csv")
      move_all_files_to_results_folder(to = "to")
      list.files("./data/from1")
    }),
    withr::with_tempdir({
      setup_fileR_directories()
      dir.create("./results/from1")
      list.files("./data/from1")
    })
  )
})
