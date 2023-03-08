#' Retrieves all files from the 'data' directory as a list.
#'
#' @description
#' Reads all csv files in the 'data' directory or in a sub folder of the 'data'
#' directory and saves them all as a list. File names are used as names for
#' list items to allow easy identification of files.
#'
#' @param folder_name Optional. Character input. Specify sub folder in 'data'
#' directory to read from.
#' @param ... Passes arguments to `read.csv()`.
#'
#' @export read_all_csv_from_data

read_all_csv_from_data <- function(folder_name = NULL, ...) {
  if(!dir.exists("data")) {
    stop("data directory does not exist")
  }
  if(!is.null(folder_name)) {
    if(!is.character(folder_name)) {
      stop("folder_name must be of type character")
    }
    if(!dir.exists(paste0("./data/", folder_name))) {
      stop(paste0(folder_name, " does not exist in the data directory"))
    }
    file_list <- list.files(paste0("./data/", folder_name))
    file_accumulator <- vector("list", length = length(file_list))
    names(file_accumulator) <- file_list
    lapply(
      file_list,
      function(file_name){
        file <- read.csv(paste0("./data/", folder_name, "/", file_name), ...)
        file_accumulator[[file_name]] <<- file
      }
    )
    return(file_accumulator)
  } else {
    file_list <- list.files("./data")
    file_accumulator <- vector("list", length = length(file_list))
    names(file_accumulator) <- file_list
    lapply(
      file_list,
      function(file_name){
        file <- read.csv(paste0("./data/", file_name), ...)
        file_accumulator[[file_name]] <<- file
      }
    )
    return(file_accumulator)
  }
  return(file_accumulator)
}
