test_that("files are transferred", {
  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      dir.create("./results/from1")
      dir.create("./results/from2")
      dir.create("./results/to")
      write.csv("a", "./results/from1/a.csv")
      write.csv("b", "./results/from2/b.csv")
      write.csv("c", "./results/from2/c.csv")
      move_all_files_to_results_folder(to = "to")
      list.files("./results/to/")
    }),
    c("a.csv", "b.csv", "c.csv")
  )
})

test_that("original files are deleted", {
  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      dir.create("./results/from1")
      dir.create("./results/from2")
      dir.create("./results/to")
      write.csv("a", "./results/from1/a.csv")
      write.csv("b", "./results/from2/b.csv")
      write.csv("c", "./results/from2/c.csv")
      move_all_files_to_results_folder(to = "to")
      list.files("./results/from1")
    }),
    vector("character")
  )
})

test_that("excluded files are unaffected", {
  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      dir.create("./results/from1")
      dir.create("./results/from2")
      dir.create("./results/to")
      write.csv("a", "./results/from1/a.csv")
      write.csv("b", "./results/from2/b.csv")
      write.csv("c", "./results/from2/c.csv")
      move_all_files_to_data_folder(to = "to", exclude = "from1")
      list.files("./results/from1")
    }),
    "a.csv"
  )
})

