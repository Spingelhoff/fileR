test_that("files are transferred", {
  a <- "a"
  b <- "b"
  c <- "c"

  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      create_data_folder("from1")
      create_data_folder("from2")
      create_data_folder("to")
      write.csv(a, "./data/from1/a.csv")
      write.csv(b, "./data/from2/b.csv")
      write.csv(c, "./data/from2/c.csv")
      move_all_files_to_data_folder(to = "to")
      list.files("./data/to/")
    }),
    withr::with_tempdir({
      setup_fileR_directories()
      create_data_folder("from")
      create_data_folder("to")
      write.csv(a, "./data/to/a.csv")
      write.csv(b, "./data/to/b.csv")
      write.csv(c, "./data/to/c.csv")
      list.files("./data/to/")
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
      create_data_folder("from1")
      create_data_folder("from2")
      create_data_folder("to")
      write.csv(a, "./data/from1/a.csv")
      write.csv(b, "./data/from2/b.csv")
      write.csv(c, "./data/from2/c.csv")
      move_all_files_to_data_folder(to = "to")
      list.files("./data/from1")
    }),
    withr::with_tempdir({
      setup_fileR_directories()
      create_data_folder("from1")
      list.files("./data/from1")
    })
  )
})
