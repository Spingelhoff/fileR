test_that("multiple files are read properly from inside data directory", {
  a <- "a"
  b <- "b"
  c <- "c"
  result <- list(
    `a.csv` = data.frame(X = 1, x = "a"),
    `b.csv` = data.frame(X = 1, x = "b"),
    `c.csv` = data.frame(X = 1, x = "c")
  )
  expect_equal(
    withr::with_tempdir({
      setup_fileR_directories()
      write.csv(a, "data/a.csv")
      write.csv(b, "data/b.csv")
      write.csv(c, "data/c.csv")
      read_all_csv_from_data()
    }),
    result
  )
})
