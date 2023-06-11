#' Set up 'data' and 'result' directories as prescribed by fileR.
#'
#' @description
#' Looks for directories named 'data' and 'result' in current directory. Will
#' creates them if directories do not exist. This is the set up for all other
#' functions in the package and it is expected projects start by calling this
#' function. Will also optionally create directory and library setup .R files
#' to reduce project start up time.
#' 
#' @param setup Boolean input. Optionally creates setup .R script files.
#'
#' @export setup_fileR_directories

setup_fileR_directories <- function(setup = TRUE) {
  if(dir.exists("data") & dir.exists("results")) {
    warning("data and results directories already exist")
  }
  if(!dir.exists("data")) {
    dir.create("data")
  }
  if(!dir.exists("results")) {
    dir.create("results")
  }
  if(!file.exists("library_setup.R") & setup == TRUE) {
    file.create("library_setup.R")
    writeLines(
      "library(fileR)",
      con = "library_setup.R"
    )
  }
  if(!file.exists("directory_setup.R") & setup == TRUE) {
    file.create("directory_setup.R")
    writeLines(
      c("source(library_setup.R)", "setup_fileR_directories()"),
      con = "directory_setup.R"
    )
  }
}
