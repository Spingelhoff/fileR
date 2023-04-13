test_that("files are transferred", {
  a <- "a"
  b <- "b"
  c <- "c"

  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      save_csv_to_results_folder(a, "from", "a.csv")
      save_csv_to_results_folder(b, "from", "b.csv")
      save_csv_to_results_folder(c, "from", "c.csv")
      dir.create("./results/to")
      move_files_between_results_folders(from = "from", to = "to")
      list.files("./results/to")
    }),
    withr::with_tempdir({
      setup_fileR_directories()
      dir.create("./results/from")
      save_csv_to_results_folder(a, "to", "a.csv")
      save_csv_to_results_folder(b, "to", "b.csv")
      save_csv_to_results_folder(c, "to", "c.csv")
      list.files("./results/to")
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
      save_csv_to_results_folder(a, "from", "a.csv")
      save_csv_to_results_folder(b, "from", "b.csv")
      save_csv_to_results_folder(c, "from", "c.csv")
      dir.create("./results/to")
      move_files_between_results_folders(from = "from", to = "to")
      list.files("./results/from")
    }),
    withr::with_tempdir({
      setup_fileR_directories()
      dir.create("from")
      list.files("./results/from")
    })
  )
})
