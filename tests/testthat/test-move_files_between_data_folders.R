test_that("files are transferred", {
  a <- "a"
  b <- "b"
  c <- "c"

  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      create_data_folder("from")
      create_data_folder("to")
      write.csv(a, "./data/from/a.csv")
      write.csv(b, "./data/from/b.csv")
      write.csv(c, "./data/from/c.csv")
      move_files_between_data_folders(from = "from", to = "to")
      list.files("./data/to")
    }),
    withr::with_tempdir({
      setup_fileR_directories()
      create_data_folder("from")
      create_data_folder("to")
      write.csv(a, "./data/to/a.csv")
      write.csv(b, "./data/to/b.csv")
      write.csv(c, "./data/to/c.csv")
      list.files("./data/to")
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
      create_data_folder("from")
      create_data_folder("to")
      write.csv(a, "./data/from/a.csv")
      write.csv(b, "./data/from/b.csv")
      write.csv(c, "./data/from/c.csv")
      move_files_between_data_folders(from = "from", to = "to")
      list.files("./data/from")
    }),
    withr::with_tempdir({
      setup_fileR_directories()
      create_data_folder("from")
      list.files("./data/from")
    })
  )
})
