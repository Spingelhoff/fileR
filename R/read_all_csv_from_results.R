#' Retrieves all files from the 'results' directory as a list.
#'
#' @description
#' Reads all csv files in the 'results' directory or in a sub folder of the 'results'
#' directory and saves them all as a list. File names are used as names for
#' list items to allow easy identification of files.
#'
#' @param folder_name Optional. Character input. Specify sub folder in 'results'
#' directory to read from.
#' @param ... Passes arguments to `read.csv()`.
#'
#' @export read_all_csv_from_results

read_all_csv_from_results <- function(folder_name = NULL, ...) {
  if(!dir.exists("results")) {
    stop("results directory does not exist")
  }
  if(!is.null(folder_name)) {
    if(!is.character(folder_name)) {
      stop("folder_name must be of type character")
    }
    if(!dir.exists(paste0("./results/", folder_name))) {
      stop(paste0(folder_name, " does not exist in the results directory"))
    }
    file_list <- list.files(paste0("./results/", folder_name))
    file_accumulator <- vector("list", length = length(file_list))
    names(file_accumulator) <- file_list
    lapply(
      file_list,
      function(file_name){
        file <- read.csv(paste0("./results/", folder_name, "/", file_name), ...)
        file_accumulator[[file_name]] <<- file
      }
    )
    return(file_accumulator)
  } else {
    file_list <- list.files("./results")
    file_accumulator <- vector("list", length = length(file_list))
    names(file_accumulator) <- file_list
    lapply(
      file_list,
      function(file_name){
        file <- read.csv(paste0("./results/", file_name), ...)
        file_accumulator[[file_name]] <<- file
      }
    )
    return(file_accumulator)
  }
  return(file_accumulator)
}
