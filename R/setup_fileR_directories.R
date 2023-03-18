#' Set up 'data' and 'result' directories as prescribed by fileR.
#'
#' @description
#' Looks for directories named 'data' and 'result' in current directory. Will
#' creates them if directories do not exist. This is the set up for all other
#' functions in the package and it is expected projects start by calling this
#' function.
#'
#' @export setup_fileR_directories

setup_fileR_directories <- function() {
  if(dir.exists("data") & dir.exists("results")) {
    warning("data and results directories already exist")
  }
  if(!dir.exists("data")) {
    dir.create("data")
  }
  if(!dir.exists("results")) {
    dir.create("results")
  }
}
