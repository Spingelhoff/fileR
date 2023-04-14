test_that("files are transferred", {
  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      create_data_folder("from1")
      create_data_folder("from2")
      create_data_folder("to")
      write.csv("a", "./data/from1/a.csv")
      write.csv("b", "./data/from2/b.csv")
      write.csv("c", "./data/from2/c.csv")
      move_all_files_to_data_folder(to = "to")
      list.files("./data/to/")
    }),
    c("a.csv", "b.csv", "c.csv")
  )
})

test_that("original files are deleted", {
  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      create_data_folder("from1")
      create_data_folder("from2")
      create_data_folder("to")
      write.csv("a", "./data/from1/a.csv")
      write.csv("b", "./data/from2/b.csv")
      write.csv("c", "./data/from2/c.csv")
      move_all_files_to_data_folder(to = "to")
      list.files("./data/from1")
    }),
    vector("character")
  )
})

test_that("excluded files are unaffected", {
  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      create_data_folder("from1")
      create_data_folder("from2")
      create_data_folder("to")
      write.csv("a", "./data/from1/a.csv")
      write.csv("b", "./data/from2/b.csv")
      write.csv("c", "./data/from2/c.csv")
      move_all_files_to_data_folder(to = "to", exclude = "from1")
      list.files("./data/from1")
    }),
    "a.csv"
  )
})
